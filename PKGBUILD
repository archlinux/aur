# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=bluez-tools-git
pkgver=r127.gf653217
pkgrel=1
pkgdesc="A set of tools to manage bluetooth devices"
arch=('i686' 'x86_64')
url="https://github.com/khvzak/bluez-tools"
license=('GPL')
depends=('glibc' 'bluez')
makedepends=('git')
provides=('bluez-tools')
conflicts=('bluez-tools')
source=("git+https://github.com/khvzak/bluez-tools.git")
sha256sums=('SKIP')


pkgver() {
  cd "bluez-tools"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "bluez-tools"

  ./autogen.sh \
    --prefix="/usr"
  make
}

check() {
  cd "bluez-tools"

  make check
}

package() {
  cd "bluez-tools"

  make DESTDIR="$pkgdir" install
}
