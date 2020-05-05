# Maintainer: Jean-Michaël Celerier <jeanmichael.celerier at gmail dot com>
pkgname=cninja
pkgver=3.0.0
release_tag=v3.0.0
pkgrel=1
pkgdesc="cninja, an opinionated cmake config manager"
arch=('x86_64')
url="https://github.com/jcelerier/cninja"
license=('AGPLv3')
depends=('cmake' 'clang' 'lld' 'ninja')
makedepends=('boost')
optdepends=()
provides=("$pkgname=$pkgver")
conflicts=()
replaces=()
source=("https://github.com/jcelerier/cninja/releases/download/v${pkgver}/cninja-${pkgver}-src.tar.gz")
sha512sums=("1a1034ba086d222f706e05b5e08c3122224d1f3ede629de2cee1654ecc177e072366320503be4ce91ae58a2bb7d93cc606878dbe834f98eb63cfff03bc0b27cc")

build() {
  cd "$srcdir"

  mkdir -p "$srcdir/build"
  cd "$srcdir/build"
  cmake \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
	  -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/bin" \
	  "$srcdir"

  cmake --build .
}

package() {
  cd "$srcdir/build"
  cmake --build . --target install/strip
  install -D -m644 "$srcdir/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
