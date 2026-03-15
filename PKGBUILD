# Maintainer: Martin Vlček <martin-vlcek@post.cz>

pkgname=derg-clock-popup
pkgver=1.0.1
pkgrel=2
pkgdesc="An animated popup window telling the current time"
arch=('x86_64' 'aarch64')
url="https://github.com/ZenithCrow/derg-clock-popup"
license=('MIT' 'CC-BY')
depends=(
    'sdl3'
    'sdl3_ttf'
    'sdl3_image'
    'glibc'
)
makedepends=('zig') 
source=("$pkgname-$pkgver.tar.gz::https://github.com/ZenithCrow/derg-clock-popup/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4f66e1a1038f825ba323096f9b0c9a246dbead38cd43aad70bb718ce0858edc8')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    sudo zig build -Doptimize=ReleaseSafe --prefix /usr
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    sudo zig build -Doptimize=ReleaseSafe --prefix /usr --prefix-exe-dir "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
