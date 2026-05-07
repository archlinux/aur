# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

_pkgname=openzl
pkgname="$_pkgname"
pkgver=0.2.0
pkgrel=1
pkgdesc='A novel data compression framework'
url='https://github.com/facebook/openzl'
arch=('aarch64' 'x86_64')
license=('BSD')
depends=('glibc')
makedepends=('clang' 'cmake')
provides=("libopenzl.so=0.1.0")
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2ad14ed9af63d4a70cb05df5d5629871d052371ad017cf5559dc76c41ae3865f')

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
