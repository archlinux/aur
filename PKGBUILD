# Maintainer: Andrew Shark <ashark @ at @ linuxcomp.ru>
pkgname=bookmarksync-git
pkgver=0.1.1.r9.g1d21df0
pkgrel=2
pkgdesc="sync file picker bookmarks for KDE and GTK"
arch=(x86_64)
url="https://github.com/jlu5/bookmarksync"
license=('GPLv3')
depends=(qt5-base)
makedepends=(git)
source=(git+https://github.com/jlu5/bookmarksync.git)
sha256sums=("SKIP")

build() {
    cd ${pkgname%-git}/src
    qmake
    make -j$(nproc)  # Read user's option from makepkg.conf? Example in notepadqq-git.
}

package() {
    install -D ${pkgname%-git}/src/bookmarksync "${pkgdir}/usr/bin/bookmarksync"
    install -D ${pkgname%-git}/bookmarksync.desktop "${pkgdir}/usr/share/applications/bookmarksync.desktop"
}

pkgver() {
    cd "${pkgname%-git}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
