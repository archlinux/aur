# Maintainer: Andrew Shark <ashark @ at @ linuxcomp.ru>

pkgname=bookmarksync-git
pkgver=0.3.0.r9.g275cddf
pkgrel=2
pkgdesc="Sync file picker bookmarks (pinned folders) for KDE and GTK"
arch=(x86_64)
url="https://github.com/jlu5/bookmarksync"
license=('GPLv3')
depends=(qt6-base)
makedepends=(cmake git kiconthemes kio)
source=(git+https://github.com/jlu5/bookmarksync.git)
sha256sums=("SKIP")

build() {
    cmake -B build -S ${pkgname%-git}/src
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D ${pkgname%-git}/bookmarksync.desktop "${pkgdir}/usr/share/applications/bookmarksync.desktop"
}

pkgver() {
    cd "${pkgname%-git}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
