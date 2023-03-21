# Maintainer: Nicholas Novak <34256932+NickyBoy89@users.noreply.github.com>

pkgname=typst-git
pkgver=r1621.4428646c
pkgrel=1
pkgdesc="A new markup-based typesetting system that is powerful and easy to learn. "
license=('Apache-2.0')
arch=('any')
makedepends=('git' 'cargo')
provides=('typst')
depends=()
url="https://github.com/typst/typst"
source=(
	"typst::git+https://github.com/typst/typst"
)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/typst"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/typst"
  cargo build -p typst-cli --release
}

package() {
	# Install the binary
	install -vDm 755 "$srcdir/typst/target/release/typst" "$pkgdir/usr/bin/typst"

  # Install the licenses
  install -vDm 644 "$srcdir/typst/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
