# Maintainer: Jonathan Grotelüschen <tippfehlr@archlinux.org>

pkgbase=radicle-bin
pkgname=(radicle-bin radicle-{cli,node}-bin)
epoch=1
pkgver=1.7.1
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
sha512sums_x86_64=('e82d99b824cd25e249f000425f710710b4ebc92b8f197542548011016f29d49eb38d7df3a31d64984d981b04fff72914e9d45d95eb5318a4af90eaebe4995e24')
sha512sums_aarch64=('ed13579e02d9b44c2b46c27204af626986c4c0c56c19cd6a279868d9e9074ef27d669583f2cc0c5ca775fd0b9286d891746772f350a730e5dbf927e7b02a70b2')

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
