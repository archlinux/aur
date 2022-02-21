# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD
# Original Submitter: Bob Finch <w9ya@qrparci.net>

pkgname=fldigi-docs
_pkgname=fldigi
__pkgname=FLDigi
_author=fldigi
pkgver=4.1.20
pkgrel=1
pkgdesc="Documentation/help when using FLDIGI w/out i-net access - Ham Radio"
arch=('any')
url="http://www.w1hkj.com/FldigiHelp/index.html"
license=('GPL')
optdepends=('fldigi' 'epdfview')
makedepends=('git' 'doxygen' 'texlive-latexextra')
source=("$_pkgname::git://git.code.sf.net/p/$_author/$_pkgname#branch=master")
#http://w1hkj.com/${_pkgname}-help/${__pkgname}_Users_Manual.pdf
#https://sourceforge.net/projects/$_pkgname/files/$_pkgname/${_pkgname}-help.pdf

pkgver() {
	cd $_pkgname

	git describe --tags | sed -r 's/-([0-9,a-g,A-G]{7}.*)//' | sed 's/^v//g' | sed 's/-2//g'
#	git describe --tags | sed 's/^v//g'
}

build() {
	cd $srcdir/$_pkgname/${_pkgname}_doxygen

	./make_docs.sh 		 # <- Use this for ONLY User's Manual
#	./make_docs.sh prog user # <- Use to add Programmer's Ref. Manual
}

package() {
	cd $srcdir/$_pkgname/${_pkgname}_doxygen

	mkdir -p $pkgdir/usr/share/doc/$_pkgname/html
#	install -Dm644 compressed_html/* $pkgdir/usr/share/doc/$_pkgname
	install -Dm644 user_docs/html/* $pkgdir/usr/share/doc/$_pkgname/html
	install -Dm644 pdf/* $pkgdir/usr/share/doc/$_pkgname
}
md5sums=('SKIP')
sha256sums=('SKIP')
