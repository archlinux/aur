# Maintainer: Axel McLaren <scm(at)axml(dot)uk>

pkgname=sexpect
pkgver=2.3.15
pkgrel=1
pkgdesc="Expect for shells"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/clarkwang/sexpect"
makedepends=('cmake')

source=($pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('44f5711aa99f3ccf9c4b0edfcd9a7d25fa64b442574624ce451713d1532c1a7e')

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
