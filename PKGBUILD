# Maintainer: zneix <zneix@zneix.eu>

pkgname=wg-systray-git
_pkgname=wg-systray
pkgver=r6.17fc0f2
pkgrel=2
pkgdesc='System tray icon which helps managing WireGuard interfaces.'
arch=('x86_64')
url='https://github.com/GaZaTu/wg-systray'
license=('MIT')
depends=('qt5-base' 'wireguard-tools')
makedepends=('cmake' 'git')
provides=('wg-systray')
conflicts=()
source=('wg-systray::git+https://github.com/GaZaTu/wg-systray')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=None ..
    make
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/wg-systray"

    cd build
    make DESTDIR="$pkgdir" install
}
