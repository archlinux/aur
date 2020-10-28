# Maintainer: Chris Vittal <chris@vittal.dev>
pkgbase=polydeukes
pkgname=(pldsrv pldget)
pkgver=0.1.2
pkgrel=1
pkgdesc="A gemini client and server"
arch=('x86_64')
url="https://git.sr.ht/~cdv/polydeukes"
license=('AGPL3')
makedepends=('rust')
source=("$pkgbase-$pkgver.tar.gz::https://git.sr.ht/~cdv/$pkgbase/archive/$pkgver.tar.gz"
        'service')
sha512sums=('4f6ed413feb602cf7f262f841c1bb0740ac460b3fc4c3a93168626e35d06f3df3f4610b91bdccbb94dbf84418b24719fe4f7d7acd745bc364c28b738049e9b5e'
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
