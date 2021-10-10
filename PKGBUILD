# Contributor: Andrew Panchenko <panchenkoac at gmail>
# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=qmmp-plugin-pack
pkgver=2.0.0
pkgrel=1
pkgdesc="Qmmp Plugin Pack"
arch=('i686' 'x86_64')
url="http://qmmp.ylsoftware.com"
license=('GPL')
depends=("qmmp>=$pkgver" 'taglib>=1.7.0' 'mpg123>=1.13.0' 'libxmp>=4.2.0')
makedepends=('cmake>=2.8.6' 'yasm' 'qt6-tools')
source=(http://qmmp.ylsoftware.com/files/qmmp-plugin-pack/2.0/${pkgname}-${pkgver}.tar.bz2)
sha1sums=('6312e1d8e41afff82b9079945a8b8bb76c44ae38')

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
