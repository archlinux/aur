# Maintainer: Fen <FenchsA.com>
pkgname=pacfilemerge
pkgver=1.0.0
pkgrel=1
pkgdesc="A utility for automating the handling of .pacnew and .pacsave files in Arch Linux"
arch=('x86_64')
url="https://github.com/FenchsApps/pacmerge"
license=('MIT')
depends=('gcc-libs' 'boost-libs' 'nlohmann-json')
makedepends=('cmake' 'boost' 'nlohmann-json')
source=("v$pkgver.tar.gz::https://github.com/FenchsApps/pacmerge/archive/v$pkgver.tar.gz")
sha256sums=('197047a76ab4ce8b1a580afe8e2fb732922494ab925c63f2cbf528b3204bf551')

build() {
    cd "$srcdir/pacmerge-$pkgver"
    mkdir -p build
    cd build
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/pacmerge-$pkgver/build"
    make DESTDIR="$pkgdir" install

    # Install license
    install -Dm644 "$srcdir/pacmerge-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install config file
    install -Dm644 "$srcdir/pacmerge-$pkgver/data/config.json" "$pkgdir/etc/pacfilemerge/config.json"

    # Create backup directory
    install -dm755 "$pkgdir/var/lib/pacfilemerge/backups"
} 