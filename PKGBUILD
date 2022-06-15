# Maintainer: Ivan Krivosheev <py.krivosheev@gmail.com>

pkgname=xbacklight-notify
pkgver=1.1.0
pkgrel=1
pkgdesc="XBacklight volume notification"
arch=(x86_64)
url="https://github.com/ikrivosheev/xbacklight-notify"
license=(MIT)
depends=(libnotify libxcb)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('3d147ca1d93375c5e29318ffd7aab73c')

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

