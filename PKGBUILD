# Maintainer: Grzegorz Alibożek <grzegorz.alibozek@gmail.com>
_gitname="weather-widget-2"
pkgname=plasma-applets-weather-widget-2
pkgver=3.0.4
pkgrel=1
pkgdesc="An updated version of the plasma-applet-weather-widget by Kotelnik"
arch=('x86_64')
url="https://github.com/blackadderkate/$_gitname"
license=('GPL')
depends=('plasma-workspace' 'qt6-5compat' 'qt6-declarative')
makedepends=('extra-cmake-modules')
source=(${url}/archive/refs/tags/V${pkgver}.tar.gz)
sha256sums=('020671b8259db86495c2f21fe08455d92b6fba5c958e8dd3eb51bda7f8f178a3')
conflicts=('plasma-applets-weather-widget-3')
provides=('plasma-applets-weather-widget-3')

build() {
    cmake -B ./build -S ./${_gitname}-${pkgver} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
