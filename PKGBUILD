# Maintainer: Bart Libert <aur@bart.libert.email>
_pkgname=LprGUI
pkgname=lprgui-git
pkgver=r22.dee6596
pkgrel=1
pkgdesc='qt5 based frontend for lpr cli command'
arch=(x86_64)
url='https://github.com/KeithDHedger/LprGUI'
license=(GPL3)
provides=(lpgrui)
depends=(cups qt5-base)
makedepends=(git make qt5-tools)
source=(git+https://github.com/KeithDHedger/LprGUI.git)
sha256sums=('SKIP')

prepare() {
# Make sure LDFLAGS are used
  cd "$_pkgname"
  sed -i 's/-fPIC/-fPIC ${LDFLAGS}/' Makefile
}

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
}
