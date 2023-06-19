# Maintainer: Ivan Krivosheev <py.krivosheev@gmail.com>

pkgname=acpi-backlight-notify
pkgver=0.0.1
pkgrel=1
pkgdesc="ACPI backlight notification daemon"
arch=(x86_64)
url="https://github.com/ikrivosheev/acpi-backlight-notify"
license=(MIT)
depends=(libnotify glib2)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('170568e724d01c70c9ed7f3fde8957f3')

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

