# Maintainer: Popolon <popolon @t popolon d.t org>

pkgname=lvgl
pkgver=9.5.0
pkgrel=1
pkgdesc="Light and Versatile Graphics Library"
url="https://lvgl.io/"
license=("MIT")
arch=($CARCH)
depends=()
makedepends=('cmake>=3.12.4' 'ninja' 'sdl2')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lvgl/lvgl/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('34a955cdf3a2d005507b704e87357af669a114523b6d3f77b5344fdc68717bc6')

build() {
        cd ${pkgname}-${pkgver}
        cp -a lv_conf_template.h lv_conf.h
        if [ ! -e build ]; then mkdir build; fi
	cd build
        cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
                 -DBUILD_SHARED_LIBS=ON
        make
}

package() {
        cd ${pkgname}-${pkgver}/build
	DESTDIR="${pkgdir}" make install
}
