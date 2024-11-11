pkgname=cen64-qt-git
pkgver=20241110
pkgrel=1
pkgdesc="A basic frontend for CEN64"
arch=('i686' 'x86_64')
url="https://github.com/dh4/cen64-qt"
license=('BSD')
depends=('quazip-qt6' 'cen64-git' 'hicolor-icon-theme')
makedepends=('git' 'cmake')
install=cen64-qt-git.install
source=("git+https://www.github.com/dh4/cen64-qt.git")
sha256sums=('SKIP')

pkgver() {
    cd cen64-qt
    git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
    cd cen64-qt
    ./build-scripts/revision.sh

    cmake .
    make
}

package() {
    cd cen64-qt
    install -Dm755 "cen64-qt"                     "$pkgdir/usr/bin/cen64-qt"
    install -Dm644 "LICENSE"                      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "resources/cen64-qt.desktop"   "$pkgdir/usr/share/applications/cen64-qt.desktop"
    install -Dm644 "resources/images/cen64.png"   "$pkgdir/usr/share/icons/hicolor/128x128/apps/cen64-qt.png"
}
