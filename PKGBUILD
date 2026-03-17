# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=archy-st
pkgver=0.10.3
pkgrel=3
pkgdesc='Simple terminal emulator for X with some patches applied'
url="https://github.com/archy-linux/$pkgname"
arch=('i686' 'x86_64')
license=('MIT')
depends=('libx11' 'libxinerama' 'libxft' 'freetype2' 'fontconfig' 'harfbuzz')
makedepends=('make' 'gzip' 'ncurses')
provides=(st)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f3d05c52c7dbdb6b39cf16d12ba5d5b9da5e19370045687041ad6d32c6757ca6')

build() {
    cd "$pkgname-$pkgver"
    make -j
    gzip -9 st.1
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 st "$pkgdir/usr/bin/st"
    install -Dm644 st.1.gz "$pkgdir/usr/share/man/man1/st.1.gz"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
    # install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/xsessions/$pkgname.desktop"
}

# vim: ts=4 sw=4 et:
