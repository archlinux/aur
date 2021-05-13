# Maintainer: zneix <zneix@zneix.eu>

pkgname=x11-emoji-picker-git
pkgver=r41.4c47dd3
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
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/x11-emoji-picker"
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    cd "$srcdir/x11-emoji-picker"
    install -Dm 755 "build/emoji-picker" "$pkgdir/usr/bin/emoji-picker"
}
