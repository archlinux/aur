# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=sexpect
pkgver=2.3.12
pkgrel=1
pkgdesc="Expect for shells"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/clarkwang/sexpect"
makedepends=('cmake')

source=($pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('7f43955aa6c328c90f9a6e7500a1f552bd44616f89b75b67b04aef6ee153cb1a')

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
