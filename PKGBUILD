# Maintainer: Mathias Rav <m@git.strova.dk>
pkgname=fbspinner
pkgver=0.1.1
pkgrel=2
pkgdesc="Show a spinner on the framebuffer during system boot"
arch=('i686' 'x86_64')
url="https://github.com/Mortal/$pkgname"
license=('GPL')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("https://github.com/Mortal/$pkgname/archive/v$pkgver.tar.gz"
        fbspinner.service
        fbspinner-quit.service)
md5sums=('c1b7767b1e8cb5bf776ec6b8b18ca0ae'
         '2757ec5504c2086f2107e055737f3a9b'
         'e96aec5d699bb738193ff0170fdaeb82')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"
    cargo install --root="$pkgdir/usr" --path .
    rm -f "$pkgdir/usr/.crates.toml"
    install -Dm0644 "$srcdir/$pkgname-$pkgver/share/anim.bin" "$pkgdir/usr/share/$pkgname/anim.bin"
    install -Dm0644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm0644 "$srcdir/$pkgname-quit.service" "$pkgdir/usr/lib/systemd/system/$pkgname-quit.service"
}
