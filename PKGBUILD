# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=flrig-docs
_pkgname=flrig
__pkgname=FLRig
_author=fldigi
pkgver=1.3.28
pkgrel=1
pkgdesc="Documentation/help when using FLRIG w/out i-net access"
arch=('any')
url="http://www.w1hkj.com/flrig-help"
license=('GPL')
optdepends=('flrig' 'epdfview')
makedepends=('git' 'doxygen' 'texlive-latexextra')
source=("$_pkgname::git://git.code.sf.net/p/$_author/$_pkgname#branch=master")
#http://w1hkj.com/${_pkgname}-help/${__pkgname}_Users_Manual.pdf
#http://www.w1hkj.com/flrig-help/FLRig_Users_Manual.pdf

pkgver() {
	cd $_pkgname

	git describe --tags | sed 's/^v//g'
}

build() {
	cd $srcdir/$_pkgname/doxygen

	./make_docs.sh 		 # <- Use this for ONLY User's Manual
#	./make_docs.sh prog user # <- Use to add Programmer's Ref. Manual
}

package() {
	cd $srcdir/$_pkgname/doc

	mkdir -p $pkgdir/usr/share/doc/$_pkgname
	install -Dm644 compressed_html/* $pkgdir/usr/share/doc/$_pkgname
	install -Dm644 pdf/* $pkgdir/usr/share/doc/$_pkgname
}
md5sums=('SKIP')
sha256sums=('SKIP')
