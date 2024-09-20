# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: aksr <aksr at t-com dot me>

pkgbase=libertinus-font-git
_fname="${pkgbase%-font-git}"
pkgname=(otf-$_fname-git)
pkgver=7.040.r79.g302a906c
pkgrel=3
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
	fontship make -- static-otf
}

package_otf-libertinus-git() {
	cd "$_fname"
	provides=("$pkgbase=$pkgver")
	provides=("${pkgbase%-git}=$pkgver")
	provides=("${pkgname%-git}=$pkgver")
	confilcts=("${pkgname%-git}")
	install -Dm644 -t "$pkgdir/usr/share/fonts/${_fname}/" "${_fname^}"*.otf
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt AUTHORS.txt
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md preview.svg FONTLOG.txt documentation/*.pdf
}
