# Maintainer: Popolon <popolon @t popolon d.t org>

pkgname=lvgl
pkgver=9.1.0
pkgrel=1
pkgdesc="Light and Versatile Graphics Library"
url="https://lvgl.io/"
license=("MIT")
arch=(x86_64 armv7h aarch64 riscv32 riscv64)
depends=()
makedepends=('cmake>=3.12.4' 'ninja')
checkdepends=(SDL2)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lvgl/lvgl/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6930f1605d305fcd43f31d5f470ecf4a013c4ce0980e78ee4c33b96a589bf433')

build() {
        cd ${pkgname}-${pkgver}
        cp -a lv_conf_template.h ../lv_conf.h
        if [ ! -e build ]; then mkdir build; fi
	cd build
        cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
                 -DBUILD_SHARED_LIBS=ON \
        make
}

package() {
        cd ${pkgname}-${pkgver}/build
	DESTDIR="${pkgdir}" make install
}
