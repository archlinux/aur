# Maintainer: Jean-Michaël Celerier <jeanmichael.celerier at gmail dot com>
pkgname=cninja
pkgver=3.6.1
release_tag=v3.6.1
pkgrel=1
pkgdesc="Opinionated CMake config manager"
arch=('x86_64')
url="https://github.com/jcelerier/cninja"
license=('AGPLv3')
depends=('cmake' 'clang' 'lld' 'ninja' 'libc++')
makedepends=('boost')
optdepends=()
provides=("$pkgname=$pkgver")
conflicts=()
replaces=()
source=("https://github.com/jcelerier/cninja/releases/download/v${pkgver}/cninja-v${pkgver}-src.tar.gz")
sha512sums=("4a64ac1b7ebc6f16f2c92d9c197b0c3a5d2135662af0da513a61b4a05e5a6014dc777d7c9a081aa1252cfb40723bdc717face298316a2ad8d11fb943a7d893c6")

build() {
  cd "$srcdir"

  mkdir -p "$srcdir/build"
  cd "$srcdir/build"
  cmake \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
	  -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
	  "$srcdir"

  cmake --build .
}

package() {
  cd "$srcdir/build"
  cmake --build . --target install/strip
  install -D -m644 "$srcdir/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
