# Maintainer: Zine Yu zine.xlws@gmail.com

pkgname=buck2-bin
pkgver=2025.10.15
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
	sha256sums=('2d5d81eddb6bd6f0cd7107b2614a87cfa8e1d8dc253873fb3c3605b21ec590f9')
	;;
aarch64)
	_platform="aarch64-unknown-linux-gnu"
	sha256sums=('7af17b1eaa3a9d3fa06042b46cec719528754d73f6d4102eb6a64c3922e2fa9a')
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
