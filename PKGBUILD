# Maintainer: Alexandria <alxpettit@gmail.com>

_pkgname=remake
pkgname=cmake-${_pkgname}-git
pkgver=1
pkgrel=3
pkgdesc='A set of CMake macros for restructuring GNU Automake/Autoconf projects.'
url='https://github.com/kralf/remake'
arch=('any')
license=('LGPL')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/kralf/${_pkgname}.git" remove_debian_crap.patch)
md5sums=('SKIP'
         '5e25c8aba4976390a2b401e8732dec5a')

provides=("cmake-${_pkgname}")
conflicts=("cmake-${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare () {
        cd "${srcdir}/${_pkgname}"
        patch -p1 -i "${srcdir}/remove_debian_crap.patch"
}

package() {
	cd "${srcdir}/${_pkgname}"
        rm .git -rf
        cmake .
        make
        make DESTDIR="$pkgdir/" install
}
