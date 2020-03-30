# Contributor: Andrew Panchenko <panchenkoac at gmail>
# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=qmmp-plugin-pack
pkgver=1.3.2
pkgrel=1
pkgdesc="Qmmp Plugin Pack"
arch=('i686' 'x86_64')
url="http://qmmp.ylsoftware.com"
license=('GPL')
depends=("qmmp>=$pkgver" 'taglib>=1.7.0' 'mpg123>=1.13.0' 'libxmp>=4.2.0')
makedepends=('cmake>=2.8.6' 'yasm' 'qt5-tools')
source=(http://qmmp.ylsoftware.com/files/plugins/${pkgname}-${pkgver}.tar.bz2)
sha1sums=('ba45c4d19d5cb860733f75911e429a300180a41f')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    [[ -d _build ]] && rm -r _build
    mkdir _build && cd _build

    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCMAKE_BUILD_TYPE=RELEASE -DUSE_FFAP:BOOL=TRUE ../
    make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/_build"
	make DESTDIR="${pkgdir}" install
}
