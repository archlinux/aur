# Maintainer: tippfehlr <tippfehlr at tippfehlr dot eu>

pkgbase=radicle-bin
pkgname=(radicle-bin radicle-{cli,node}-bin)
epoch=1
pkgver=1.0.0
pkgrel=1
pkgdesc="open source, peer-to-peer code collaboration stack built on Git"
arch=('x86_64' 'aarch64')
license=('Apache-2.0 OR MIT')
url="https://radicle.xyz"
source=(
    "$pkgbase-$pkgver-LICENSE-MIT::https://seed.radicle.xyz/raw/rad:z3gqcJUoA1n9HaHKufZs5FCSGazv5/081af03362b5bd3d637ee22011a4e5b51a1f1498/LICENSE-MIT"
    "radicle-node.service"
)
source_x86_64=("https://files.radicle.xyz/releases/$pkgver/radicle-$pkgver-x86_64-unknown-linux-musl.tar.xz")
source_aarch64=("https://files.radicle.xyz/releases/$pkgver/radicle-$pkgver-aarch64-unknown-linux-musl.tar.xz")
sha512sums=('76235a3247342b8531cb259a1a51c9789be81e5332f210949063e4444edc2659eebe0afb0c2aae9e9c6989599d29beca0ca57a7839156c92b195bdb54c7ca448'
    '66bd43b60b73fd832a23ad7a280f77d06398c55b4e8572200ad95acc42da84e6a44c7deeb1fec91d11e29678d1abd2f74c45099ae31141ee1b6945568501bceb')
sha512sums_x86_64=('8314947640be703e19a964845352e91af3068fc69edb42938e81bbd3e3e79aa8f361853778b76a3e9f68119faefbe64613b8eb7faf8c60e886f37c4a89b58b30')
sha512sums_aarch64=('3115474dd72a006f137e3721e9727de64199e3d59a32ebef2dd367a0d4f9b3b2e339bf32c39e4e3a070457ca26e6127b2c802e2814ee1d23c0562c6a9c57b3f5')

package_radicle-bin() {
    provides=('radicle')
    conflicts=('radicle')
    depends=(radicle-{cli,node}-bin)
}

package_radicle-cli-bin() {
    pkgdesc+=" - cli"
    provides=('radicle-cli')
    conflicts=('radicle-cli')

    install -Dm644 "$pkgbase-$pkgver-LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"

    cd "radicle-$pkgver-$CARCH-unknown-linux-musl"
    install -Dm755 "bin/rad" -t "$pkgdir/usr/bin/"
    install -Dm755 "bin/git-remote-rad" -t "$pkgdir/usr/bin/"

    install -Dm644 "man/man1/rad.1" -t "$pkgdir/usr/share/man/man1/"
    install -Dm644 "man/man1/rad-patch.1" -t "$pkgdir/usr/share/man/man1/"
    install -Dm644 "man/man1/git-remote-rad.1" -t "$pkgdir/usr/share/man/man1/"
}

package_radicle-node-bin() {
    pkgdesc+=" - node"
    provides=('radicle-node')
    conflicts=('radicle-node')

    install -Dm644 "radicle-node.service" -t "$pkgdir/usr/lib/systemd/user/"
    install -Dm644 "$pkgbase-$pkgver-LICENSE-MIT" -t "$pkgdir/usr/share/licenses/$pkgname/"

    cd "radicle-$pkgver-$CARCH-unknown-linux-musl"
    install -Dm755 "bin/radicle-node" -t "$pkgdir/usr/bin/"
    install -Dm644 "man/man1/radicle-node.1" -t "$pkgdir/usr/share/man/man1/"
}
