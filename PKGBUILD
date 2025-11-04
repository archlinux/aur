# Maintainer: Zine Yu zine.xlws@gmail.com

pkgname=buck2-bin
pkgver=2025.11.01
pkgrel=1
pkgdesc="A large-scale build system from Meta, developed in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/facebook/buck2"
license=('Apache' 'MIT')
depends=('zstd')
options=('!strip')

_formatted_date() {
	echo "$pkgver" | sed 's/\./-/g'
}

case "$CARCH" in
x86_64)
	_platform="x86_64-unknown-linux-gnu"
	sha256sums=('af89fc5360cba386c61a43aba32bd3aef353c8df803a195724f42866650a5f83')
	;;
aarch64)
	_platform="aarch64-unknown-linux-gnu"
	sha256sums=('4fc8cf5d9cf150e739893321c37a394d16684200b1fb7f3b3cebbdd0116dc9f5')
	;;
esac

source=("https://github.com/facebook/buck2/releases/download/$(_formatted_date)/buck2-${_platform}.zst")

package() {
	cd "$srcdir"

	zstd -d -f "buck2-${_platform}.zst" -c >buck2
	install -Dm755 buck2 "$pkgdir/usr/bin/buck2"
}

post_install() {
	echo "buck2 has been installed to /usr/bin/buck2"
}
