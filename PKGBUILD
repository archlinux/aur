pkgname=soqt-hg
pkgver=20100809
pkgrel=2
pkgdesc="The glue between Coin & Qt"
arch=('i686' 'x86_64')
url="https://bitbucket.org/Coin3D/soqt"
license=("GPL")
depends=('coin' 'qt4')
makedepends=('doxygen')
provides=('soqt')
conflicts=('soqt')
options=('!libtool')
source=("${pkgname}::hg+https://bitbucket.org/Coin3D/soqt")
md5sums=('SKIP')

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
