# Maintainer: Grzegorz Alibożek <grzegorz.alibozek@gmail.com>
_gitname="weather-widget-2"
pkgname=plasma5-applets-weather-widget-2
pkgver=2.2.3
pkgrel=1
pkgdesc="An updated version of the plasma-applet-weather-widget by Kotelnik"
arch=('x86_64')
url="https://github.com/blackadderkate/$_gitname"
license=('GPL')
depends=('plasma-workspace' 'qt5-graphicaleffects' 'qt5-xmlpatterns')
makedepends=('extra-cmake-modules')
source=(${url}/archive/refs/tags/v${pkgver}.tar.gz
        39.patch)
sha256sums=('281921ac1988cc6ce84ba14372a98b6b9cd75d35c321d0d2e70a3f70c6e5be00'
            '67a5da44c30a1d616681fbdc04a41e03c9d9d5b535bb87402c644729dbeec805')

prepare() {
	patch -Np1 -d ./${_gitname}-${pkgver} -i ../39.patch
}

build() {
    cmake -B ./build -S ./${_gitname}-${pkgver} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
}

package() {
    make -C ./build DESTDIR="$pkgdir" install
}
