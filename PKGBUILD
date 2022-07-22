# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=sexpect
pkgver=2.3.11
pkgrel=1
pkgdesc="Expect for shells"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/clarkwang/sexpect"
makedepends=('cmake')

source=($pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('0ffdba912760383a60783bf010edc184b96d6dd454dc24922fcf7190de969e55')

build() {
  cd "${pkgname}-${pkgver}"

  cmake \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  cmake --build build
}

package() {
  cd "${pkgname}-${pkgver}"

  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
