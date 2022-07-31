# Maintainer: Frantisek Sumsal <frantisek@sumsal.cz>
pkgname=dfuzzer
pkgver=2.2
pkgrel=1
pkgdesc="D-Bus fuzzer"
arch=('x86_64')
url="https://github.com/dbus-fuzzer/dfuzzer"
license=('GPL3')
depends=(
    'glib2'
)
makedepends=(
    'docbook-xsl'
    'gcc'
    'meson'
    'pkg-config'
    'libxslt'
)
backup=(
    'etc/dfuzzer.conf'
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/dbus-fuzzer/dfuzzer/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=(
    'f89e83bb935f96e0d02330e2c2fd991bed4a107734a422447764550017fc29ce'
)

build() {
    cd "$pkgname-$pkgver"
    meson build
    ninja -C build
}

check() {
    cd "$pkgname-$pkgver"
    build/dfuzzer --version
    ninja -C build test
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" ninja -C build install
}
