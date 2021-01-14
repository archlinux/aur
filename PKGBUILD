# Maintainer: Jean-Michaël Celerier <jeanmichael.celerier at gmail dot com>
pkgname=cninja
pkgver=3.7.6
release_tag=v3.7.6
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
sha512sums=('ad21e6d1648cca2a2b0ac5fba322109c0f43410e14125af47ccf129cdb26e2e9cc576900f13383b50fff1afbd85560575cb47506eca2c4c93059d8016874ecec')

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
