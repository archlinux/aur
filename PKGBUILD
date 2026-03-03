# Maintainer: aurrrrrr <no email>

_pkgname=pixelify-sans
pkgname=("otf-${_pkgname}"
         "ttf-${_pkgname}"
         "ttf-${_pkgname}-variable")
pkgbase=pixelify-sans-font
_commit=39df74a
pkgver=r36.39df74a
pkgrel=1
pkgdesc="Pixelify Sans font by Stefie Justprince"
arch=(any)
license=('OFL-1.1')
makedepends=(git)
#source=(https://github.com/eifetx/Pixelify-Sans/archive/main.zip)
#sha256sums=('978c5651d706bf92590ffbdd9ea3eef970286936c7c66932caec29516cc6f42c')
source=(Pixelify-Sans-main::git+https://github.com/eifetx/Pixelify-Sans.git#commit=$_commit)
sha256sums=('a6fa10e82c8b0d6c669d114a305fd8c43ce03402874e8144739c1a3e8baf2708')

# is it correct to use this? or should i use this only for -git packages, even for fonts?
pkgver() {
	# git
	cd "$srcdir/Pixelify-Sans-main"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

_package_general() {
	cd "$srcdir/Pixelify-Sans-main"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}

package_otf-pixelify-sans() {
	pkgdesc+=' (OTF)'
	_package_general
	install -Dm644 -t "$pkgdir/usr/share/fonts/pixelify-sans" fonts/otf/*.otf
}

package_ttf-pixelify-sans() {
	pkgdesc+=' (TTF)'
	_package_general
	install -Dm644 -t "$pkgdir/usr/share/fonts/pixelify-sans" fonts/ttf/*.ttf
}

package_ttf-pixelify-sans-variable() {
	pkgdesc+=' (Variable TTF)'
	_package_general
	install -Dm644 -t "$pkgdir/usr/share/fonts/pixelify-sans" fonts/variable/PixelifySans\[wght\].ttf
}
