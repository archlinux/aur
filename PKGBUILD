# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=o2
pkgver=1.0.1
pkgrel=1
pkgdesc='OAuth 2.0 for Qt'
url='https://github.com/pipacs/o2'
depends=('qt5-base')
makedepends=('cmake')
arch=('i686' 'x86_64')
license=('BSD')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pipacs/o2/archive/$pkgver.tar.gz")
md5sums=('6bfeca34f3500d0b94f538b4cea2cae7')

build() {
  mkdir -p build
  cd build
  cmake ../$pkgname-$pkgver \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -Do2_WITH_OAUTH1=ON \
      -DBUILD_SHARED_LIBS=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}"/${pkgname}-${pkgver}/LICENSE \
      "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
