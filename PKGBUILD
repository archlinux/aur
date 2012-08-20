# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=ompl
pkgver=0.11.1
pkgrel=1
pkgdesc="The Open Motion Planning Library (OMPL) consists of many state-of-the-art sampling-based motion planning algorithms"
arch=('i686' 'x86_64')
url="http://ompl.kavrakilab.org/"
license=('BSD')
depends=('boost')
makedepends=('cmake')
optdepends=('py++: Python binding'
			'ode: Plan using the Open Dynamics Engine')
source=(https://bitbucket.org/ompl/ompl/downloads/${pkgname}-${pkgver}-Source.tar.gz)
md5sums=('235ca56932ff20da0c01f8201657740a')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}-Source"
	
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DPYTHON_EXEC=/usr/bin/python2 -DCMAKE_CXX_FLAGS=-D_POSIX_VERSION .
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}-Source"
	
	make DESTDIR=${pkgdir} install
}

