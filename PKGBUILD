# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

pkgname=compizconfig-python-git
pkgver=0.8.12.r2.ga365653
pkgrel=1
pkgdesc="Compizconfig bindings for python"
arch=('i686' 'x86_64')
url="https://github.com/compiz-reloaded/compizconfig-python"
license=('GPL')
depends=("compiz-core-git" 'libcompizconfig-git' 'glib2' 'python2' 'libxrandr' 'libsm' 'libxdamage')
makedepends=('intltool' 'pkgconfig' 'pyrex')
options=('!libtool')
conflicts=('compizconfig-python')
provides=('compizconfig-python')
sha1sums=('SKIP')
source=(
	'git+https://github.com/compiz-reloaded/compizconfig-python.git'
)

pkgver() {
	cd "${srcdir}/${pkgname%%-git}"
	git describe --long --tags|sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
	cd "${srcdir}/${pkgname%%-git}"
	./autogen.sh
	PYTHON=python2 ./configure --prefix=/usr
	make
}

package()
{
	cd "${srcdir}/${pkgname%%-git}"
	make DESTDIR="${pkgdir}" install
}
