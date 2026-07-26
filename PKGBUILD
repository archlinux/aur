# Maintainer: actuallyaridan <https://github.com/actuallyaridan>
#
# This is the source of truth for the AUR package. On release,
# .github/workflows/release.yml injects the real pkgver and sha256sums,
# generates .SRCINFO, and pushes both to the AUR. The two values below are
# placeholders; everything else is used verbatim.

pkgname=linux-minesweeper
pkgver=2.0.1
pkgrel=1
pkgdesc="A faithful recreation of the Windows 7 Minesweeper"
arch=('x86_64' 'aarch64')
url="https://github.com/actuallyaridan/linux-minesweeper"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-multimedia')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('22879c0fe92c95ce17ef2c11071026ce99fc5ba803eedd41e33c4344d909a5ab')

build() {
    cmake -S "$pkgname-$pkgver" -B build \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
