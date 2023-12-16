# Maintainer: Popolon <popolon @t popolon d.t org>

pkgname=lvgl
pkgver=8.3.11
pkgrel=1
pkgdesc="Light and Versatile Graphics Library"
url="https://lvgl.io/"
license=("MIT")
arch=(x86_64 armv7h aarch64 riscv32 riscv64)
depends=()
makedepends=('cmake>=3.12.4' 'ninja')
checkdepends=(SDL2)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lvgl/lvgl/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('83b7325a4b78cbb19a39f3ac75346c8086926d7faeab5ff2d825c20da0bbdb46')

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
