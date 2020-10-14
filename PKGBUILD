# Maintainer: Chris Vittal <chris@vittal.dev>
pkgbase=polydeukes
pkgname=(pldsrv pldget)
pkgver=0.1.1
pkgrel=2
pkgdesc="A gemini client and server"
arch=('x86_64')
url="https://git.sr.ht/~cdv/polydeukes"
license=('AGPL3')
makedepends=('rust')
source=("$pkgbase-$pkgver.tar.gz::https://git.sr.ht/~cdv/$pkgbase/archive/$pkgver.tar.gz"
        'service')
sha512sums=('93dbb006c0c24d7d41cd607388cf8d7bc3f9361e171cf8f9fb67911adf65724db5cd86a85aeff2ae50f11351cfe5c17247aed6a508d841f7aa4874de734cc8cc'
            '14ae5963eee667939ec75b4cbea89a504fe348bb401a6b589e156b172e7067b67dad23ea83f2a0967386caaee9520e3b3c629ba0099db14a66c23df80ca841b3')

build() {
    cd "$pkgbase-$pkgver"
    cargo build --release --locked --workspace
}

package_pldsrv() {
    depends=(gcc-libs)
    pkgdesc="A simple gemini server"

    cd "$pkgbase-$pkgver"
    install -Dm755 "target/release/pldsrv" "$pkgdir/usr/bin/pldsrv"
    install -Dm644 "pldsrv/server.example.toml" "$pkgdir/usr/share/doc/${pkgbase}/server.example.toml"
    install -Dm644 "../service" "$pkgdir/usr/lib/systemd/system/pldsrv.service"
}

package_pldget() {
    depends=(gcc-libs)
    pkgdesc="A gemini terminal client"

    cd "$pkgbase-$pkgver"
    install -Dm755 "target/release/pldget" "$pkgdir/usr/bin/pldget"
}
