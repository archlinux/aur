pkgname=typst-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="A new markup-based typesetting system that is powerful and easy to learn."
license=('Apache-2.0')
arch=('any')
makedepends=('git' 'cargo')
provides=('typst')
depends=()
url="https://github.com/typst/typst"
source=(
	"typst.zip::https://github.com/typst/typst/archive/refs/tags/v$pkgver.zip"
	"typst.xml"
)
sha256sums=('bfc9abf3b0bdee6b03966a46da9175c1eaf941d40c04b99a024a631187e7a69e'
	'51b3851df5e547ea316839bb1e2b432b475f5335a3e3fe5ec94f0f578ae4222a')

build() {
  cd "$srcdir/typst-$pkgver"
  cargo build -p typst-cli --release
}

package() {
	# Install the binary, license and mime config
	install -Dm 755 "$srcdir/typst-$pkgver/target/release/typst" "$pkgdir/usr/bin/typst"
	install -Dm 644 "$srcdir/typst-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 "$srcdir/typst.xml" "$pkgdir/usr/share/mime/packages/typst.xml"
}
