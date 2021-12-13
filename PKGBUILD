# Maintainer: Thiago L. A. Miller <thiago_leisrael@hotmail.com>
_pkgname=Sniffles
pkgname=sniffles
pkgver=1.0.12
_pkgver_prev=1.0.11
pkgrel=1
pkgdesc="Structural variation caller using third generation sequencing"
arch=('x86_64')
url="https://github.com/fritzsedlazeck/Sniffles"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake')
options=('!emptydirs')
source=("$_pkgname-$pkgver.tar.gz"::"https://github.com/fritzsedlazeck/Sniffles/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('51e5f512eb8744c152973d7ae757d484')

build() {
  cd "$_pkgname-$pkgver"
  mkdir build
  cd build
  cmake \
    -DCMAKE_COLOR_MAKEFILE:BOOL='ON' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_CXX_FLAGS='-std=c++11' \
    -Wno-dev \
    ..
  make
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dpm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dpm755 "bin/$pkgname-core-$_pkgver_prev/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
