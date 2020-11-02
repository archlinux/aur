# Maintainer: Dominic Meiser [git at msrd0 dot de]

pkgname=refinery_cli
pkgver=0.4.0
pkgrel=1
pkgdesc='Run Refinery migrations via cli.'
arch=('x86_64')
url='https://crates.io/crates/refinery_cli'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=(
	"refinery_cli.tar.gz:https://crates.io/api/v1/crates/refinery_cli/$pkgver/download"
	"https://github.com/rust-db/refinery/raw/24534b3d13924d0af649102be9aded87c0400f37/LICENSE"
)
sha512sums=('628dc611d3c0b5c79bac5f27f84731bd87ff5098d1ecda292fbba90965cdffc68adc9857ee52dfbbccd23685909827e82711863305203e3536550dec4338b177'
            '5be97e104d3733f4546be53e0ad0cb6735bdc1d2716afdee5029ea95eda7186f26f093cabee29838d80896011525025669cba47493592b546b166ed73ed8511f')

build() {
	cd "$srcdir/refinery_cli-$pkgver"
	cargo build --release --no-default-features --features postgresql
}

package() {
	cd "$srcdir/refinery_cli-$pkgver"
	install -Dm755 "target/release/refinery" -t "$pkgdir/usr/bin"
	install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
