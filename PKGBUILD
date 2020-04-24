# Maintainer: Mathias Rav <m@git.strova.dk>
pkgname=fbspinner
pkgver=0.1.2
pkgrel=1
pkgdesc="Show a spinner on the framebuffer during system boot"
arch=('i686' 'x86_64')
url="https://github.com/Mortal/$pkgname"
license=('GPL')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("https://github.com/Mortal/$pkgname/archive/v$pkgver.tar.gz"
        fbspinner.service
        fbspinner-quit.service)
sha512sums=('ccb85e254144ae1ca879f33f50db1a5f3341137f13db4fd97ef87b8d396dd174b76abeb0585e26eff8233d0d59f2cf41ece729f47655d2badba815efa32a51a8'
            '4cc7ebc6b38234e3eb173c94044574154c6af7518613b9f4692b1dc9ecd4d808c4143614fbdea9de683435d682b64ccf3132c50d250c133d3e00ec7c44ce916d'
            'e414a9b085114eb96328821513acc08606d7de06677f4d5911e6bbced46c130ce5cd9c3e281890a38eb6d0ef7d5395ddf7be56a5898640d3dd35afe3954598a6')

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
