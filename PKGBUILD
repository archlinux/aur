# Maintainer: Thorben Günther <admin@xenrox.net>

pkgname=chayang
pkgver=0.1.0
pkgrel=1
pkgdesc='Gradually dim the screen (wayland).'
arch=('x86_64')
url='https://git.sr.ht/~emersion/chayang'
license=('MIT')
depends=('wayland')
makedepends=('meson' 'wayland-protocols')
source=("https://git.sr.ht/~emersion/chayang/refs/download/v$pkgver/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('717c3243a0b7dbef3a141d06b286485fc7b75921bc4f7a555f5414ca45993b3a'
    'SKIP')
validpgpkeys=('34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48')

build() {
    cd "$pkgname-$pkgver"
    arch-meson build
    meson compile -C build
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir/" meson install -C build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
