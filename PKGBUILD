# Maintainer: fanfly <fanfly at pm dot me>
pkgname=mjai-reviewer
pkgver=1.5.3.r0.g0108dcd
pkgrel=1
pkgdesc="A mahjong game log reviewer"
arch=('any')
url="https://github.com/Equim-chan/mjai-reviewer"
license=('APACHE')
depends=()
makedepends=('git' 'rust')
optdepends=('akochan: a review engine')
source=('akochan-reviewer' 'git+https://github.com/Equim-chan/mjai-reviewer')
noextract=()
md5sums=('d96fb555b45cf4a91785b79410110aab'
		 'SKIP')

prepare() {
	cp "$srcdir/akochan-reviewer" "$pkgname"
}

pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
	cd "$pkgname"
	cargo build --release
}

package() {
	install -dm755 "$pkgdir/opt/$pkgname"
	install -Dm755 "$srcdir/$pkgname/target/release/mjai-reviewer" "$pkgdir/opt/$pkgname"
	install -Dm755 "$srcdir/$pkgname/tactics.json" "$pkgdir/opt/$pkgname"
	install -Dm755 "$srcdir/$pkgname/LICENSE" "$pkgdir/opt/$pkgname"

	install -dm755 "$pkgdir/usr/bin"
	install -Dm755 "$srcdir/$pkgname/target/release/mjai-reviewer" "$pkgdir/usr/bin/"
	install -Dm755 "$srcdir/$pkgname/akochan-reviewer" "$pkgdir/usr/bin/"
}
