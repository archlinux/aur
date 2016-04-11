# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="compiz-bcop"

pkgname=compiz-bcop-git
pkgver=0.8.12.r1.g1a9efe2
pkgrel=1
pkgdesc="Compiz option code generator"
arch=('any')
url="https://github.com/compiz-reloaded/${_upstream}"
license=('GPL')
depends=("compiz-core-git" 'libxslt')
makedepends=('intltool')
conflicts=('compiz-bcop-dev' 'compiz-bcop')
provides=('compiz-bcop')
sha1sums=('SKIP')
source=(
	"git+https://github.com/compiz-reloaded/${_upstream}.git"
)

pkgver() {
  cd "${srcdir}/${_upstream}"
  git describe --long --tags|sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
	cd "${srcdir}/${_upstream}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package()
{
	cd "${srcdir}/${_upstream}"
	make DESTDIR="${pkgdir}" install
}
