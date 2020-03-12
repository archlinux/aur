# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

_pkgname=n-ipv4ll
pkgname=$_pkgname-git
pkgver=2.12.g3325d12
pkgrel=2
pkgdesc="IPv4 Link-Local Address Selection"
url="https://github.com/nettools/n-ipv4ll"
license=('LGPL2.1' 'Apache')
arch=(x86_64)
depends=(glibc)
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=(meson pkgconf)
source=("git+https://github.com/nettools/n-ipv4ll.git")
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

#check() {
#  meson test -C build
#}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

