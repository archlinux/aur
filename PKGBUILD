# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=pinephone-keyboard-git
_pkgname=pinephone-keyboard
pkgver=r89.024d522
pkgrel=1
pkgdesc='FOSS Pinephone Keyboard Firmware and Tools'
url='https://xff.cz/git/pinephone-keyboard/about/'
license=('GPL')
arch=('i686' 'x86_64' 'aarch64')
makedepends=('php' 'sdcc')
#depends=()
source=("$_pkgname"::'git+https://xff.cz/git/pinephone-keyboard/')
conflicts=("$_pkgname")
provides=("$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"

  # hack, don't build selftest
  mkdir -p build
  touch build/ppkb-i2c-selftest
}

build() {
  cd "$srcdir/$_pkgname"

  make
}

package() {
  cd "$srcdir/$_pkgname"

  mkdir -p "$pkgdir/usr/bin"
  cp build/ppkb* "$pkgdir/usr/bin/"

  rm "$pkgdir/usr/bin/ppkb-i2c-selftest"
}
