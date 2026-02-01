# Maintainer: Jean-Michaël Celerier <jeanmichael.celerier at gmail dot com>
pkgname=cninja
pkgver=3.7.9
release_tag=v3.7.9
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
sha512sums=('db3b409d0e0c5250134a550fee8658110319d4a795aede757c1399650081c439d36ff5d16dda3643b41c66940cf6e99fc7e5230339bbc55590522ba58f82e92b')

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
