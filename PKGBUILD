# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: aksr <aksr at t-com dot me>

pkgbase=libertinus-font-git
_fname="${pkgbase%-font-git}"
pkgname=(otf-$_fname-git ttf-$_fname-git)
pkgver=7.050.r9.gf8d3386f
pkgrel=2
pkgdesc='Fonts based on Linux Libertine/Biolinum, with extended math support'
arch=(any)
url="https://github.com/alerque/$_fname"
license=(OFL-1.1-RFN)
makedepends=(fontship
             git)
source=("$_fname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_fname"
	git describe --long --tags --match="v[0-9]*" |
		  sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_fname"
	fontship make
}

package_otf-libertinus-git() {
	cd "$_fname"
	provides=("$pkgbase=$pkgver"
	          "${pkgbase%-git}=$pkgver"
	          "${pkgname%-git}=$pkgver")
	conflicts=("${pkgname%-git}")
	install -Dm644 -t "$pkgdir/usr/share/fonts/${_fname}/" "${_fname^}"*.otf
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt AUTHORS.txt
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md preview.svg FONTLOG.txt documentation/*.pdf
}

package_ttf-libertinus-git() {
	cd "$_fname"
	provides=("$pkgbase=$pkgver"
	          "${pkgbase%-git}=$pkgver"
	          "${pkgname%-git}=$pkgver")
	conflicts=("${pkgname%-git}")
	install -Dm644 -t "$pkgdir/usr/share/fonts/${_fname}/" "${_fname^}"*.ttf
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt AUTHORS.txt
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md preview.svg FONTLOG.txt documentation/*.pdf
}
