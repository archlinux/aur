# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Oleg Shparber <trollixx+aur@gmail.com>
# Contributor: Thomas Weißschuh <thomas t-8ch de>

pkgname=zeal
epoch=1
pkgver=0.6.1
pkgrel=1
pkgdesc='An offline API documentation browser'
arch=('x86_64')
url='https://zealdocs.org/'
license=(GPL3)
depends=(qt5-webkit hicolor-icon-theme libarchive qt5-x11extras)
makedepends=(cmake ninja extra-cmake-modules)
source=(zeal-${pkgver}.tar.gz::https://github.com/zealdocs/zeal/archive/v${pkgver}.tar.gz)
sha256sums=('095c08f9903071849d5c79878abd48237ce1615f16d324afff1873ab6b5f0026')

prepare() {
  mkdir -p build
}

build() {
  cd build

  cmake -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    "$srcdir/$pkgname-$pkgver"

  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
