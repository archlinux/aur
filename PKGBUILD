# Maintainer: Alex <alex@example.com>

pkgname=sofi
pkgver=1.0.1
pkgrel=1
pkgdesc="A unified app and file launcher for Wayland"
arch=('x86_64')
url="https://github.com/adsorce/sofi"
license=('MIT')
depends=('cairo' 'freetype2' 'glib2' 'harfbuzz' 'libxkbcommon' 'pango' 'wayland')
makedepends=('meson' 'scdoc' 'wayland-protocols')
source=("$pkgname-$pkgver.tar.gz::https://github.com/adsorce/sofi/archive/v$pkgver.tar.gz")
sha256sums=('77868ac05ea635156cdd61a866957c2237d77ddf86dacae2b92b29b08cd5fc72')

build() {
    cd "$pkgname-$pkgver"
    meson setup build \
        --prefix=/usr \
        --buildtype=release
    meson compile -C build
}

package() {
    cd "$pkgname-$pkgver"
    meson install -C build --destdir="$pkgdir"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}