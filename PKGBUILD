# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=qtilitools
pkgver=0.1.2
pkgrel=1
pkgdesc="Scripts/commands used in the Qtilities organization"
arch=('any')
url="https://github.com/qtilities/${pkgname}"
license=('BSD-3-Clause')
depends=('bash')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('79aa0c5f2b742b38346b83234a4e26d7b4a633f1eba47c89a9ee9309d7ef2a8d')

build() {
  mkdir -p build
  cd build
  cmake "${srcdir}/$pkgname-$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
  install -Dm644 "${srcdir}"/$pkgname-$pkgver/COPYING "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
