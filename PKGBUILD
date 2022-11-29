# Maintainer: Ivan Krivosheev <py.krivosheev@gmail.com>

pkgname=pa-notify
pkgver=1.4.2
pkgrel=1
pkgdesc="PulseAudio or PipeWire volume notification"
arch=(x86_64)
url="https://github.com/ikrivosheev/pa-notify"
license=(MIT)
depends=(libnotify libpulse)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('cdb75d684cee4be3c2f5389d64a1524a')

build() {
    export CFLAGS+=" ${CPPFLAGS}"
    export CXXFLAGS+=" ${CPPFLAGS}"

    source_dir="${pkgname}-${pkgver}"
    cmake -B build -S "${source_dir}" \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}

