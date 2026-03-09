# Maintainer:  Ilya Chelyadin <ilya77105@gmail.com>

pkgname=kokovp
pkgver=1.2.1
pkgrel=1
pkgdesc='A modern mpv-based videoplayer'
arch=('x86_64' 'aarch64')
url="https://github.com/brainrom/kokovp"
license=('GPL-2.0')
depends=('mpv' 'qt6-base')
makedepends=('git' 'cmake' 'qt6-tools' 'qt6-declarative' 'base-devel' 'clang')
source=("$pkgname-$pkgver::https://github.com/brainrom/kokovp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('eec4c6aeb14d491c43b31cb00caaecf8463aaf7ca11d79e7fda6fe164acfd279')

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
