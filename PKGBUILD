# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='gnunet-fuse-git'
_appname='gnunet-fuse'
pkgver='0.11.8.r136.060ab11'
pkgrel=1
pkgdesc='Read-only mounting of GNUnet directories as file systems using FUSE'
arch=('any')
url='https://gnunet.org/'
license=('GPL')
provides=("${_appname}")
conflicts=("${_appname}" "${_appname}-bin")
depends=('gnunet' 'fuse2')
makedepends=('autoconf')
source=("git+https://gnunet.org/git/${_appname}.git")

md5sums=('SKIP')

pkgver() {

	cd "${_appname}"
	printf "'%s.r%s.%s'" \
		"$(grep 'AC_INIT' configure.ac | grep -o '[0-9]\(\.[0-9]\+\)\+')" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"

}

prepare() {

	cd "${srcdir}/${_appname}"
	autoreconf -fi
	./configure --prefix=/usr

}

build() {

	cd "${srcdir}/${_appname}"
	make

}

check() {

	cd "${srcdir}/${_appname}"
	make check

}

package() {

	cd "${srcdir}/${_appname}"
	make DESTDIR="${pkgdir}" install

}

