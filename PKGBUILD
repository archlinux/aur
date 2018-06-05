# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="compizconfig-python"

pkgname=compizconfig-python-git
pkgver=0.8.14.r2.g3abb8fb
pkgrel=1
pkgdesc="Compizconfig bindings for python"
arch=('i686' 'x86_64')
url="https://gitlab.com/compiz/${_upstream}"
license=('GPL')
depends=("compiz-core-git" 'libcompizconfig-git' 'glib2' 'python' 'libxrandr' 'libsm' 'libxdamage')
makedepends=('intltool' 'pkgconfig' 'cython')
options=('!libtool')
conflicts=('compizconfig-python')
provides=('compizconfig-python')
sha1sums=('SKIP')
source=(
	"git+https://gitlab.com/compiz/${_upstream}.git"
)

pkgver() {
	cd "${srcdir}/${_upstream}"
	git describe --long --tags|sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
	cd "${srcdir}/${_upstream}"
	NOCONFIGURE=1 ./autogen.sh
	PYTHON=python ./configure --prefix=/usr
	make
}

package()
{
	cd "${srcdir}/${_upstream}"
	make DESTDIR="${pkgdir}" install
}
