pkgname=diesel_cli
pkgver=0.10.1
pkgrel=1
pkgdesc='CLI for the Diesel crate'
arch=(i686 x86_64)
url='http://diesel.rs/'
license=(MIT Apache)
depends=(rust)
makedepends=(cargo)
source=("https://github.com/diesel-rs/diesel/archive/v$pkgver.tar.gz" dependency.patch)
sha256sums=('8ac0614943e595712f2990aa7b3cfbaa3068d5f070c7c33e61fd5486732722f8'
            '1f238d6539332cecf533c63025a846e753ecc52ed892670bdae472e43c6fc76f')

prepare() {
	cd "$srcdir/diesel-$pkgver/$pkgname"
	patch -p1 -i "$srcdir/dependency.patch"
}

build() {
	cd "$srcdir/diesel-$pkgver/$pkgname"
	cargo build --release
}

package() {
	install -Dm755 "$srcdir/diesel-$pkgver/target/release/diesel" "$pkgdir/usr/bin/diesel"
}
