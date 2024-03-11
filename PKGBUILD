# Maintainer: not_anonymous <nmlibertarian@gmail.com>

# Based on gnucash-docs <- de extra repo
#		^^^^^ Current Maintainer: Juergen Hoetzel <juergen@archlinux.org>
# AND on gnucash-git <- de aur
# 		^^^^^ Current Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=gnucash-docs-git
_pkgname=gnucash-docs
__pkgname=Gnucash
pkgver=5.5.r16.g1ccea462
#.r16.g1ccea462
#.r0.g1d039709
#.r22.g874ac13
pkgrel=1
pkgdesc="GnuCash documentation package - GIT version"
arch=('any')
url="http://www.gnucash.org/docs.phtml"
license=('GPL-2.0-only OR GFDL-1.1-only')
depends=('yelp')
makedepends=('git' 'docbook-xsl' 'cmake')
# 'rarian' 'libtool' 'autoconf' 'automake')
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

#prepare() {
#	cd "$srcdir/$pkgname"
#
#	./autogen.sh
#}

build() {
	cd $srcdir/$pkgname

#	./configure --prefix=/usr
	mkdir build && cd build

	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		..

	make
}

#check() {
#	cd $srcdir/$pkgname
#
#	cmake -k check
#}

package() {
	cd $srcdir/$pkgname/build

	make DESTDIR="$pkgdir/" install
}
md5sums=('SKIP')
sha256sums=('SKIP')
