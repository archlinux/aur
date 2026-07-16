# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-cmake-modules
pkgver=6.28.0
pkgrel=1
pkgdesc='Extra modules and scripts for CMake'
arch=(any)
url='https://github.com/Sonic-DE/sonic-frameworks-cmake-modules'
license=(LGPL)
depends=(cmake)
makedepends=(python-requests
             python-sphinx
             qt6-tools)
optdepends=('python-pyxdg: to generate fastlane metadata for Android apps'
            'python-requests: to generate fastlane metadata for Android apps'
            'python-yaml: to generate fastlane metadata for Android apps')
provides=(extra-cmake-modules)
conflicts=(extra-cmake-modules)
groups=(sonicde-frameworks)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0ca6a8123252e2865e0e6dd58079d14328e25de9b188171f8c9862b6f32d28d1')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_HTML_DOCS=ON \
    -DBUILD_QTHELP_DOCS=ON \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
