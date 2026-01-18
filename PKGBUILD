# Maintainer: Popolon <popolon @t popolon d.t org>

pkgname=lvgl
pkgver=9.4.0
pkgrel=1
pkgdesc="Light and Versatile Graphics Library"
url="https://lvgl.io/"
license=("MIT")
arch=(x86_64 armv7h aarch64 riscv32 riscv64)
depends=()
makedepends=('cmake>=3.12.4' 'ninja' 'sdl2')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lvgl/lvgl/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('932c864de98431b38c5758a87f1de12bbee7b76943b8312bcf13d2f29ac14627')

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
