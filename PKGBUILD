# Maintainer: Yardena Cohen <yardenack at gmail dot com>

pkgname=soqt-hg
pkgver=1933.e8310fe21c1b
pkgrel=1
pkgdesc="The glue between Coin & Qt"
arch=('i686' 'x86_64')
url="https://bitbucket.org/Coin3D/soqt"
license=("GPL")
depends=('coin' 'qt4')
makedepends=('doxygen' 'mercurial')
provides=('soqt')
conflicts=('soqt')
options=('!libtool')
source=("${pkgname}::hg+https://bitbucket.org/Coin3D/soqt"
	 "hg+https://bitbucket.org/Coin3D/generalmsvcgeneration"
	 "hg+https://bitbucket.org/Coin3D/soanydata"
	 "hg+https://bitbucket.org/Coin3D/sogui")
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	echo "$(hg identify -n).$(hg identify -i)"
}

build() {
	cd "${srcdir}/${pkgname}"
	./configure --prefix=/usr \
		--enable-optimization \
		--enable-man \
		--enable-exceptions \
		--disable-debug \
		--disable-maintainer-mode \
		--disable-dependency-tracking \
		--enable-shared \
		--disable-static \
		--with-qt=/usr \
		--enable-threadsafe \
		--enable-html
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR=${pkgdir} install
}
