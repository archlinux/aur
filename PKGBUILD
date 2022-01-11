# Maintainer: zneix <zneix@zneix.eu>

pkgname=x11-emoji-picker-git
pkgver=0.8.2.r10.gcf0dd46
pkgrel=1
pkgdesc='Linux XServer emoji picker written in C++.'
arch=('x86_64' 'armv7h')
url=https://github.com/GaZaTu/x11-emoji-picker
license=('MIT')
depends=('qt5-base' 'icu' 'xdotool')
makedepends=('cmake' 'git')
provides=('x11-emoji-picker')
conflicts=('x11-emoji-picker')
source=('x11-emoji-picker::git+https://github.com/GaZaTu/x11-emoji-picker')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/x11-emoji-picker"
    git describe --long --tags --exclude nightly-build | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/x11-emoji-picker"
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=None ..
    make
}

package() {
    cd "$srcdir/x11-emoji-picker"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/x11-emoji-picker"

    cd build
    make DESTDIR="$pkgdir" install
}
