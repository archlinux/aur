# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>

pkgname=lib2geom-git
pkgver=1.0.r69.g226eb8c6
pkgrel=1
pkgdesc="a library developed to provide a robust computational geometry framework"
arch=('x86_64')
url="http://lib2geom.sourceforge.net/"
license=('GPL')
depends=('glib2' 'cairo' 'gsl' 'gtest' 'double-conversion')
makedepends=('git' 'cmake' 'ninja' 'gtest' 'boost')
conflicts=('lib2geom')
provides=('lib2geom=1.0')
source=('git+https://gitlab.com/inkscape/lib2geom.git')
md5sums=('SKIP')

pkgver() {
	cd lib2geom
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	mkdir -p lib2geom/build
}

build() {
	cd lib2geom/build
	cmake .. \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-D2GEOM_BUILD_SHARED=YES \
		-D2GEOM_TOYS=NO \
		-D2GEOM_TESTING=NO \
		-G Ninja
	ninja
}

package() {
	cd lib2geom/build
	DESTDIR="$pkgdir/" ninja install
}
