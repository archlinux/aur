# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: Greg von Nessi <greg.vonnessi@gmail.com>
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=jfsrec-svn
_pkgname=jfsrec
pkgver=20070316.7
pkgrel=1
pkgdesc='Read only extraction of files and directories from a damaged jfs filesystem'
url='http://jfsrec.sourceforge.net/'
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('boost')
optdepends=('dd_rhelp')
makedepends=('subversion')
source=("${_pkgname}::svn://svn.code.sf.net/p/jfsrec/code"
        'recent.patch')
sha1sums=('SKIP'
          '4abae30d417f34f3afc89799c5e6126644f1fb52')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
        cd "${SRCDEST}/${_pkgname}"
	svn info | awk '/Revision/{r=$2}/Date/{gsub(/-/,"");d=$4}END{print d"."r}'
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	patch -p1 -i ../recent.patch
}

build() {
	cd "${srcdir}/${_pkgname}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
}
