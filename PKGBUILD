# Maintainer: Ottoponti

pkgname=storage-monitor
pkgver=1.0.0
pkgrel=1

pkgdesc="Qt 6 application for monitoring SMART health and managing Btrfs filesystems"
arch=('x86_64')
url="https://github.com/Brigio/storagemonitor"
license=('GPL-3.0-or-later')
install=storage-monitor.install

depends=(
    'qt6-base'
    'btrfs-progs'
    'smartmontools'
    'polkit'
    'util-linux'
)

makedepends=(
    'cmake'
    'ninja'
)

optdepends=(
    'msmtp: email notifications'
)

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/Brigio/storagemonitor/archive/refs/tags/v$pkgver.tar.gz"
)

sha256sums=('05b8f45a0000fee35ac49659f651fe5898ec62b3617377ee5216684029b8d8e8')

build() {
    cmake \
        -S "$srcdir/storagemonitor-$pkgver" \
        -B "$srcdir/build" \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr

    cmake --build "$srcdir/build"
}

package() {
    DESTDIR="$pkgdir" \
        cmake --install "$srcdir/build"
}
