# Maintainer: dax <dev@dax.moe>
pkgname=ddhx-git
pkgver=r93.6d0eeb0
pkgrel=1
pkgdesc="Console hexadecimal file viewer"
arch=('x86_64')
url="https://github.com/dd86k/ddhx"
license=('MIT')
depends=()
makedepends=('git' 'dub' 'dmd')
provides=("ddhx")
conflicts=("ddhx")
source=('git+https://github.com/dd86k/ddhx')
md5sums=('SKIP')

pkgver() {
	cd ddhx
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ddhx
	dub build -b release-nobounds
}

package() {
	cd ddhx
	install -D ddhx "$pkgdir"/usr/bin/ddhx
	install -D -m 0644 docs/ddhx.1 "$pkgdir"/usr/share/man/man1/ddhx.1
	install -D -m 0644 LICENSE "$pkgdir"/usr/share/licenses/ddhx/LICENSE
	install -D -m 0644 README.md "$pkgdir"/usr/share/doc/ddhx/README.md
}
