# Maintainer: Martin Vlček <martin-vlcek@post.cz>

pkgname=derg-clock-popup
pkgver=1.0.2
pkgrel=1
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
sha256sums=('3aa3c9faa054d387d5e5d4400db83f8617c9857d20937922894fc624c44b3193')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    DESTDIR=build zig build --release=safe --prefix "/usr"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    cp -a build/* "$pkgdir/usr"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
