# Maintainer: Gaetan Bisson <bisson@archlinux.org
# Contributor: Gilles CHAUVIN <gcnweb at gmail dot com>

pkgname=xplanet-svn
_pkgname=xplanet
pkgver=20130526.202
pkgrel=1
pkgdesc='Renders an image of the earth into the X root window'
url='http://xplanet.sourceforge.net/'
arch=('i686' 'x86_64' 'armv7h')
license=('GPL2')
makedepends=('subversion')
depends=('pango' 'giflib' 'libtiff' 'libxss')
source=("${_pkgname}::svn://svn.code.sf.net/p/xplanet/code/trunk"
        "giflib.patch")
sha1sums=('SKIP'
          'c9fe0f25ddc64c1aaf319d77cb5ddcb64a230667')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
        cd "${srcdir}/${_pkgname}"
        svn info | awk '/Revision/{r=$2}/Date/{gsub(/-/,"");d=$4}END{print d"."r}'
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	patch -p1 <"${srcdir}/giflib.patch"
}

build() {
	cd "${srcdir}/${_pkgname}"
	./configure --prefix=/usr --with-freetype
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make prefix="${pkgdir}"/usr install
}
