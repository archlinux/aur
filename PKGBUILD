# Maintainer: not_anonymous <nmlibertarian@gmail.com>

# Based on gnucash-docs <- de extra repo
#		^^^^^ Current Maintainer: Juergen Hoetzel <juergen@archlinux.org>
# AND on gnucash-git <- de aur
# 		^^^^^ Current Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=gnucash-docs-git
_pkgname=gnucash-docs
__pkgname=Gnucash
pkgver=2.6.5
#.r22.g874ac13
pkgrel=1
pkgdesc="GnuCash documentation package - GIT version"
arch=('any')
url="http://www.gnucash.org/docs.phtml"
license=('GPL3' 'FDL')
depends=('yelp')
makedepends=('rarian' 'docbook-xsl' 'libtool' 'autoconf' 'automake')
conflicts=('gnucash-docs')
provides=('gnucash-docs')
source=("$pkgname::git+https://github.com/${__pkgname}/${_pkgname}.git")

pkgver() {
	cd $srcdir/$pkgname

	( set -o pipefail
	  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "$srcdir/$pkgname"

	./autogen.sh
}

build() {
	cd $srcdir/$pkgname

	./configure --prefix=/usr
	make
}

check() {
	cd $srcdir/$pkgname

	make -k check
}

package() {
	cd $srcdir/$pkgname

	make DESTDIR="$pkgdir/" install
}
md5sums=('SKIP')
sha256sums=('SKIP')
