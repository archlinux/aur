# Maintainer: Gaute Hope <eg@gaute.vetsj.com>
pkgname=abunchoftags
pkgver=0651600
pkgrel=1
epoch=
pkgdesc="a keyword <-> tag sync utility for notmuch and offlineimap/GMail"
arch=('x86_64' 'i686')
url="https://github.com/gauteh/abunchoftags"
license=('GPL')
groups=()
depends=('notmuch' 'boost' 'boost-libs' 'gmime' 'glibmm')
makedepends=('scons' 'git' 'pkg-config')
checkdepends=('')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(abunchoftags::git+https://github.com/gauteh/abunchoftags.git)
noextract=()
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  scons
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/abunchoftags/"

  cp keywsync "${pkgdir}/usr/bin/"
  cp examples/fetch_and_sync.sh "${pkgdir}/usr/share/abunchoftags/"

  if [ -e notmuch_get_revision ]; then
    cp notmuch_get_revision "${pkgdir}/usr/bin/"
  fi
}

pkgver() {
  cd "$pkgname"
  git describe --long --tags --always | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

