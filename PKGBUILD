# Maintainer: Ivan Krivosheev <py.krivosheev@gmail.com>

pkgname=backlight-notify
pkgver=0.0.1
pkgrel=1
pkgdesc="ACPI backlight notification daemon"
arch=(x86_64)
url="https://github.com/ikrivosheev/acpi-backlight-notify"
license=(MIT)
depends=(libnotify glib2)
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

