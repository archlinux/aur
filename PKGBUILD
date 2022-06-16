# Maintainer: Frantisek Sumsal <frantisek@sumsal.cz>
pkgname=dfuzzer
pkgver=2.0
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
    'a1f556f84f03720aa4015d6d5ab87a684f999f472a86ae14e1b48bcdade45040'
)

build() {
    cd "$pkgname-$pkgver"
    meson build
    ninja -C build
}

check() {
    cd "$pkgname-$pkgver"
    build/dfuzzer --version
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" ninja -C build install
}
