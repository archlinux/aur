# Maintainer: Blair Noctis <ncts@nightsail.net>
pkgbase=server-mono
pkgname=({otf,woff2}-$pkgbase)
pkgver=0.0.6
pkgrel=1
pkgdesc='typeface inspired by typewriters, ASCII art, and CLI/programming tools'
arch=('any')
url='https://servermono.com'
license=('OFL-1.1')
depends=()
makedepends=()
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/internet-development/www-server-mono/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('07d2eff6a11b9939b0d397198bec9258da6b43660d6f0fa8814e543f617d2b82')

prepare() {
	# currently named www-$pkgbase-$pkgver
	mv *$pkgbase-$pkgver $pkgbase-$pkgver || true
}

__package_fmt-server-mono() {
	local fmt=$1
	cd "$srcdir/$pkgbase-$pkgver"
	local font_dir="usr/share/fonts/${fmt^^}"
	install -dm755 "$pkgdir/$font_dir"
	install -m644 fonts/*.${fmt} "$pkgdir/$font_dir/"
}

for _pkg in ${pkgname[@]}; do
	local fmt=${_pkg/-$pkgbase/}
	eval "function package_$_pkg() { __package_fmt-server-mono $fmt; }"
done

