# Maintainer: Ivan Krivosheev <py.krivosheev@gmail.com>

pkgname=xbacklight-notify
pkgver=1.1.2
pkgrel=1
pkgdesc="Xorg backlight notification daemon"
arch=(x86_64)
url="https://github.com/ikrivosheev/xbacklight-notify"
license=(MIT)
depends=(libnotify libxcb)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('3ee6e602a5a9b9d48f0ba1b4e4e70812')

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

