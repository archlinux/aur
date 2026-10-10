# Maintainer: actuallyaridan <https://github.com/actuallyaridan>
#
# This is the source of truth for the AUR package. On release,
# .github/workflows/release.yml injects the real pkgver and sha256sums,
# generates .SRCINFO, and pushes both to the AUR. The two values below are
# placeholders; everything else is used verbatim.

pkgname=linux-explorer
pkgver=1.2
pkgrel=1
pkgdesc="A faithful recreation of Windows 7's Explorer"
arch=('x86_64')
url="https://github.com/actuallyaridan/linux-explorer"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-multimedia' 'kio' 'kcoreaddons' 'kconfig'
         'kwidgetsaddons' 'kwindowsystem' 'solid' 'libaero-qt')
optdepends=('kio-extras: real search, and archives that open as folders'
            'kio-admin: Open as Administrator'
            'ark: Send to Compressed (zipped) folder'
            'ffmpegthumbs: thumbnails for video'
            'kdegraphics-thumbnailers: thumbnails for PDF and RAW'
            'kdenetwork-filesharing: Samba browsing behind Map network drive')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('07aed5aa30f06a91fc7c3413178f1815657901d4be13e14d47f2718a155f6956')

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
