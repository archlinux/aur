# Maintainer: Marcin Kornat <rarvolt+aur@gmail.com>

pkgname=boost-63-compat
pkgver=1.63.0
pkgrel=1
pkgdesc="Free peer-reviewed portable C++ source libraries - compat version"
arch=('i686' 'x86_64')
url="http://www.boost.org/"
license=('Boost Software License, Version 1.0.')
depends=('python' 'icu')
makedepends=('make')
options=()
source=("https://download.sourceforge.net/project/boost/boost/1.63.0/boost_1_63_0.tar.bz2")
sha256sums=('beae2529f759f6b3bf3f4969a19c2e9d6f0c503edcb2de4a61d1428519fcb3b0')

build() {
    export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:/usr/include/python3.6m/"
    cd "${srcdir}/boost_1_63_0"
	./bootstrap.sh
	./b2 variant=release link=shared runtime-link=shared stage
}

package() {
	cd "${srcdir}/boost_1_63_0"
    mkdir -p ${pkgdir}/usr/lib
	./b2 install --prefix=${pkgdir}/usr
    for FILE in $(ls "${pkgdir}/usr/lib" | grep .so$); do
        rm "${pkgdir}/usr/lib/${FILE}"
    done
    for FILE in $(ls "${pkgdir}/usr/lib" | grep .a$); do
        rm "${pkgdir}/usr/lib/${FILE}"
    done
    rm -r "${pkgdir}/usr/include"
}
