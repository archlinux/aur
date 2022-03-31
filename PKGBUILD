# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=flrig-docs
_pkgname=flrig
__pkgname=FLRig
_author=fldigi
pkgver=1.4.5
pkgrel=1
pkgdesc="Documentation/help when using FLRIG w/out i-net access - Ham Radio"
arch=('any')
url="http://www.w1hkj.com/flrig-help"
license=('GPL')
makedepends=('git' 'doxygen' 'texlive-latexextra')
optdepends=('flrig' 'epdfview')
source=("$_pkgname::git://git.code.sf.net/p/$_author/$_pkgname#branch=master")
#http://w1hkj.com/${_pkgname}-help/${__pkgname}_Users_Manual.pdf
#http://www.w1hkj.com/flrig-help/FLRig_Users_Manual.pdf

pkgver() {
	cd $_pkgname

	git describe --tags | sed -r 's/-([0-9,a-g,A-G]{7}.*)//' | sed 's/^v//g' | sed 's/-2//g' | sed 's/0\(.\)$/\1/'
#	git describe --tags | sed -r 's/-([0-9,a-g,A-G]{7}.*)//' | sed 's/^v//g' | sed 's/-2//g'
#	git describe --tags | sed 's/^v//g'
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
