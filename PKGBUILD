# Maintainer:  Ilya Chelyadin <ilya77105@gmail.com>

pkgname=kokovp
pkgver=1.2.0
pkgrel=1
pkgdesc='A modern mpv-based videoplayer'
arch=('x86_64')
url="https://github.com/brainrom/kokovp"
license=('GPL-2.0')
depends=('mpv' 'qt6-base')
makedepends=('git' 'cmake' 'qt6-tools' 'qt6-declarative' 'base-devel' 'clang')
source=("$pkgname-$pkgver::git+https://github.com/brainrom/kokovp.git#tag=v$pkgver")
sha256sums=('SKIP')


build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m 0644 $srcdir/$pkgname-$pkgver/kokovp.desktop "$pkgdir/usr/share/applications/kokovp.desktop"
}
