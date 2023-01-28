# Maintainer: gazatu <gazatu@protonmail.com>

pkgname=im-emoji-picker-fcitx5-git
pkgver=1.0.1.c8511b6
pkgrel=1
pkgdesc='emoji picker compatible with Linux systems using either XServer or Wayland with either Fcitx5 or IBus'
arch=('x86_64')
url=https://github.com/GaZaTu/im-emoji-picker
license=('MIT')
depends=('qt5-base' 'icu' 'fcitx5')
makedepends=('cmake' 'git')
provides=('im-emoji-picker')
conflicts=('im-emoji-picker')
source=('im-emoji-picker::git+https://github.com/GaZaTu/im-emoji-picker')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/im-emoji-picker"
    git describe --long --tags --exclude nightly-build | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/im-emoji-picker"
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=None -DONLY_FCITX5=1 ..
    make
}

package() {
    cd "$srcdir/im-emoji-picker"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/im-emoji-picker"

    cd build
    make DESTDIR="$pkgdir" install
}
