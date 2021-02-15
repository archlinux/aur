# Maintainer: Gabriel Guldner <gabriel at guldner dot eu>

# Contributor: Tomas Jasek <tomsik68(at)gmail(dot)com>
# Contributor: Alex Brinister <alex_brinister at yahoo dot com>

pkgname='papyrus'
pkgver='5.0.0'
_eclipsever='2020-12'
pkgrel=2
pkgdesc='Graphical editing tool for UML based on eclipse.'
arch=('x86_64')
url='http://www.eclipse.org/papyrus/'
license=('EPL')
groups=()
depends=(java-runtime python libsecret)
makedepends=(tar)
provides=('papyrus')
conflicts=('papyrus')
sha256sums=('7a69c82a8d53b91036f80ab81c7a26a375fbfd3ac488c91c203cdc55f9a67d8d'
            '0bf0ff5eacc3e955a01c171cc21d8c989707ed9eee668ce176d67cfae06c8608'
            '255f1d8b0277bb9e4a3f84d09294fe34a54485b29f67220733343f37db052b94')
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
