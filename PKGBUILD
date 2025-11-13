# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

_pkgname=openzl
pkgname="$_pkgname"
pkgver=0.1.0
pkgrel=5
pkgdesc='A novel data compression framework'
url='https://github.com/facebook/openzl'
arch=('aarch64' 'x86_64')
license=('BSD')
depends=('glibc')
makedepends=('clang' 'cmake')
provides=("libopenzl.so=0.1.0")
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3278546dcdbae3aef3887f07b435ebe0aa9f6943a5ac74cf9b7baeefe6526c2e')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DOPENZL_BUILD_TESTS=ON -DOPENZL_ALLOW_INTROSPECTION=OFF ..
  cd ../
  make zli lib
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # DESTDIR="${pkgdir}" ninja -C build install
  install -Dm755 zli "$pkgdir/usr/bin/zli" 
  install -Dm755 libopenzl.so "$pkgdir/usr/lib/libopenzl.so"
  install -Dm644 libopenzl.a "$pkgdir/usr/lib/libopenzl.a"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
