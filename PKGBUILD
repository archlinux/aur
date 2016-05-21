# Maintainer: Omar Pakker <omar.pakker@oracle.com>

pkgname=piglit-git
pkgver=r8676.4d667d4
pkgrel=1
pkgdesc="OpenGL implementation testing suite. Provides a simple means to perform regression tests."
arch=('i686' 'x86_64')
url="http://piglit.freedesktop.org/"
license=('GPL2' 'GPL3' 'LGPL2.1')
depends=('waffle' 'python-mako' 'python-numpy' 'python-six' 'libxrender' 'glu' 'libcaca')
optdepends=('python-lxml: Accelerated python XML library using libxml2'
			'python-simplejson: Fast implementation of the python JSON library')
makedepends=('git' 'cmake' 'glproto')
provides=('piglit')
conflicts=('piglit')
options=('!emptydirs')
install=piglit.install
changelog=
source=("git://anongit.freedesktop.org/piglit")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/piglit"
	
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/piglit"
	
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
	
	make
}

package() {
	cd "${srcdir}/piglit"
	
	make DESTDIR="${pkgdir}/" install
	
	cd "${pkgdir}/usr/lib/piglit/lib/"
	find . -name "*.so" -exec ln -s '{}' "../../{}" \;
}

