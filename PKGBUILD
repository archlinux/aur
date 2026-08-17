# Maintainer: Limehawk <128890849+limehawk@users.noreply.github.com>
pkgname=omarchy-imageview
pkgver=0.3.1
pkgrel=1
pkgdesc="Image viewer and browser for the Omarchy desktop"
arch=('x86_64')
url="https://github.com/limehawk/omarchy-imageview"
license=('MIT')
depends=('gtk4' 'librsvg' 'libheif')
optdepends=('perl-image-exiftool: lossless JPEG/TIFF rotation')
makedepends=('rust' 'cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/limehawk/omarchy-imageview/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d98c221a29c731e73b1ed90fe08f9dfd0a2c2192c5944b713307578a6efc9f2a')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
