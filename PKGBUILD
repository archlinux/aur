pkgname=audela-svn
_pkgname=audela
pkgver=r15879
pkgrel=1
pkgdesc="AudeLA is a TCL extension aimed at providing amateur astronomers with image processing, telescope controling, ccd camera driving, and various astronomical algorithms"
arch=(x86_64)
url="https://sourceforge.net/projects/audela/"
license=(GPL)
depends=('tcl' 'tk')
makedepends=('subversion' 'libjpeg6-turbo')
source=("svn+https://svn.code.sf.net/p/${_pkgname}/code/trunk/${_pkgname}")
sha256sums=('SKIP')


pkgver() {
  	cd "$_pkgname"
  	local ver="$(svnversion)"
  	printf "r%s" "${ver//[[:alpha:]]}"
}


build() {
	cd "${srcdir}/${_pkgname}/src/"
	./configure --prefix=/usr
	make all
}

package() {
	cd "${srcdir}/${_pkgname}/src/audela"
	make DESTDIR="${pkgdir}" install
}

