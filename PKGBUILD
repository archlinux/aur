# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-cmake-modules
pkgver=6.30.0
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
sha256sums=('e39f62a1fc0e58ddc36612ddcc850e4ef7f6b59db68b38d4573bf150ed1633cb')

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
