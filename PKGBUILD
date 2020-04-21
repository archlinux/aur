# Maintainer: Jean-Michaël Celerier <jeanmichael.celerier at gmail dot com>
pkgname=cninja
pkgver=2.0.0
release_tag=v2.0.0
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
sha512sums=("32414b604c6850d5fb657ca6b533ed19e0f16301132c1cce9bade2c38270c003067d52d861af6020b46ea12fadcaa9b099d123b7c691cda3042d09ec25ed7f0e")

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
