# Maintainer: mateball9333-debug <mateball9333-debug@users.noreply.github.com>

pkgname=qtiker-git
pkgver=0.9.0.r0.g0000000
pkgrel=1
pkgdesc='Small Qt clicker game for Linux'
arch=('x86_64')
url='https://github.com/mateball9333-debug/qtiker'
license=('GPL-2.0-or-later' 'Apache-2.0' 'custom:Tux')
depends=('qt6-base' 'qt6-svg' 'qt6-multimedia' 'hicolor-icon-theme')
makedepends=('git' 'cmake')
provides=('qtiker')
conflicts=('qtiker')
source=('git+https://github.com/mateball9333-debug/qtiker.git')
sha256sums=('SKIP')

pkgver() {
    cd qtiker
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' || printf '0.2.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cmake -S qtiker -B build \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
