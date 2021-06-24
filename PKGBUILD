# Maintainer: Ivan Krivosheev <py.krivosheev@gmail.com>

pkgname=pa-notify
pkgver=1.1.0
pkgrel=1
pkgdesc="Lightweight PulseAudio volume notification"
arch=(x86_64)
url="https://github.com/ikrivosheev/pa-notify"
license=(MIT)
depends=(libnotify libpulse)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('0f4985b5f72f46e11e0ec5582f28266a')

build() {
    export CFLAGS+=" ${CPPFLAGS}"
    export CXXFLAGS+=" ${CPPFLAGS}"

    source_dir="${pkgname}-${pkgver}"
    build_dir="${source_dir}/build"
    cmake -B "${build_dir}" -S "${source_dir}" \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build "${build_dir}" 
}

package() {
    make -C "${pkgname}-${pkgver}/build" DESTDIR="$pkgdir" install
}

