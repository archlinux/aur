# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

pkgname=compiz-bcop-git
_pkgname=bcop
pkgver=0.8.10.r1.g1eff7f4
pkgrel=1
pkgdesc="Compiz option code generator"
arch=('any')
url="http://git.northfield.ws/compiz/?p=compiz/bcop;a=summary"
license=('GPL')
depends=("compiz-core-git" 'libxslt')
makedepends=('intltool')
conflicts=('compiz-bcop-dev' 'compiz-bcop')
provides=('compiz-bcop')
sha1sums=('SKIP')
source=(
	'git://northfield.ws/compiz/bcop'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
	cd "${srcdir}/${_pkgname}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package()
{
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
}
