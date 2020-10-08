# Maintainer: Gabriel Guldner <gabriel at guldner dot eu>

# Contributor: Tomas Jasek <tomsik68(at)gmail(dot)com>
# Contributor: Alex Brinister <alex_brinister at yahoo dot com>

pkgname='papyrus'
pkgver='4.8.0'
pkgrel=1
pkgdesc='Graphical editing tool for UML based on eclipse.'
arch=('x86_64')
url='http://www.eclipse.org/papyrus/'
license=('EPL')
groups=()
depends=(java-runtime python libsecret)
makedepends=(tar)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
_eclipsever='2020-06'
md5sums=(
  '2998813786cd8b03b72e07eb048b99e3'
  '411d949e9e15e4e60f01f66091e18421'
  'd1d0f87c71fccdcca0bec57ccf36c2f0'
)
source=(
  "http://ftp-stud.fht-esslingen.de/pub/Mirrors/eclipse/modeling/mdt/papyrus/rcp/${_eclipsever}/${pkgver}/papyrus-${_eclipsever}-${pkgver}-linux64.tar.gz"
  "papyrus.png"
  "papyrus.desktop"
)
noextract=()

build() {
  cd $srcdir
  tar -xvzf papyrus-${_eclipsever}-${pkgver}-linux*.tar.gz
  mkdir -p $srcdir/usr/bin/
  echo -e '#!/bin/sh\nexec /usr/lib/papyrus/papyrus' > $srcdir/papyrus
}

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/lib/papyrus
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/icons
  mkdir -p $pkgdir/usr/share/applications

  install -m644 papyrus.png $pkgdir/usr/share/icons/
  install -m755 papyrus.desktop $pkgdir/usr/share/applications/

  cd "$srcdir/Papyrus"
  find . -type f -exec install -vDm755 {} $pkgdir/usr/lib/papyrus/{} \;

  install -m755 $srcdir/papyrus $pkgdir/usr/bin/
  # mv $pkgdir/usr/lib/papyrus/icon.xpm $pkgdir/usr/share/icons/papyrus.xpm
}