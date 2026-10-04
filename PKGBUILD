# maintainer: verse <versedev.store@proton.me>
_pkgname=ClakIME
pkgname=clak
pkgver=0.2.1
pkgrel=1
pkgdesc="Fast and highly stable Vietnamese input method for Fcitx5 and Wayland"
arch=('x86_64' 'aarch64')
url="https://github.com/versenilvis/clak"
license=('0BSD')
depends=('fcitx5' 'hicolor-icon-theme' 'libinput' 'systemd-libs')
makedepends=('cmake' 'ninja' 'extra-cmake-modules' 'rust' 'cargo')
provides=('fcitx5-clak')
conflicts=('fcitx5-clak')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$_pkgname-$pkgver"
    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build -j"$(nproc)"
}

package() {
    DESTDIR="$pkgdir" cmake --install "$srcdir/$_pkgname-$pkgver/build"
}
