# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>
pkgname=libctl-git
pkgver=4.0.0.r5.g8ef00d7
pkgrel=1
pkgdesc='Guile-based library implementing flexible control files for scientific simulations'
arch=('i686' 'x86_64')
url='https://github.com/stevengj/libctl'
license=('GPL2')
depends=('guile' 'gcc-fortran')
options=('!libtool')
provides=('libctl')
conflicts=('libctl')
source=('git+https://github.com/stevengj/libctl.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/libctl"
	git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/libctl"
	sed -i '/unknown argument/d' autogen.sh
	./autogen.sh LIBS='-lm' --prefix=/usr --enable-shared
	make
}

package() {
	cd "${srcdir}/libctl"
	make DESTDIR=${pkgdir} install
}
