# Maintainer: Ivan Krivosheev <py.krivosheev@gmail.com>

pkgname=acpi-backlight-notify
pkgver=1.0.0
pkgrel=1
pkgdesc="ACPI backlight notification daemon"
arch=(x86_64)
url="https://github.com/ikrivosheev/acpi-backlight-notify"
license=(MIT)
depends=(libnotify glib2)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('b28b2a1e328d9e67b5889c5529fa3eb4')

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

