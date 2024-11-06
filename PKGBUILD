
pkgname=pkdns
pkgver=0.5.2
pkgrel=1

pkgdesc="A DNS server providing self-sovereign and censorship-resistant domain names. It resolves records hosted on the Mainline DHT."
url="https://github.com/pubky/pkdns"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('openssl' )
makedepends=('rustup')
provides=(pkdns)
source=(
    "git+$url.git#tag=v${pkgver}"
)

sha256sums=('0c6187e608ba3be8d7b1b7d4661a3fd35c6288c3cf3b2fbe1e40d356a1d680c8')
sha512sums=('7152fd42718b5a358b39ae4acb65b4d4d097109c33c76c9150229c0f8a9ff737a31713dfd5ca9f328d4311ab9c62d1485f1ab39cbc7259b7de19d1d1641347d0')
prepare() {
    echo "Preparing pkdns..."
    cd "${srcdir}/pkdns"
    cargo build --release
}
package (){
    echo "Packing pkdns..."
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/pkdns/target/release/pkdns" "${pkgdir}/usr/bin/pkdns"
    install -Dm755 "${srcdir}/pkdns/target/release/pkdns-cli" "${pkgdir}/usr/bin/pkdns-cli"
}