# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

_pkgname=n-dhcp4
pkgname=$_pkgname-git
pkgver=1.9.g9ba143a
pkgrel=2
pkgdesc="Dynamic Host Configuration Protocol for IPv4"
url="https://github.com/nettools/n-dhcp4"
license=('LGPL2.1' 'Apache')
arch=(x86_64)
depends=(glibc)
provides=($_pkgname)
conflicts=($_pkgname)
makedepends=(meson pkgconf)
source=("git+https://github.com/nettools/n-dhcp4.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^v//;s/-/./g;s/_/./g;'
}

build() {
  rm -rf build
  arch-meson $_pkgname build
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

