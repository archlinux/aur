# Maintainer: Limehawk <128890849+limehawk@users.noreply.github.com>
pkgname=omarchy-imageview
pkgver=0.3.0
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
sha256sums=('8e8d3b76141d1262a37af246a189ac14da72e64e8e7d9b40fcc6888d4067964c')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
