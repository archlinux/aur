# Contributor: jospehgbr <rafael.f.f1@gmail.com>
# Maintainer: GordonGR <ntheo1979@gmail.com>

_pkgname=fribidi
pkgname=lib32-${_pkgname}
pkgver=0.19.7
pkgrel=3
pkgdesc="A Free Implementation of the Unicode Bidirectional Algorithm (32 bit)"
arch=('x86_64')
license=('LGPL')
url="http://fribidi.org"
depends=('lib32-glib2' "${_pkgname}")
source=("https://github.com/fribidi/fribidi/archive/${pkgver}.tar.gz")
md5sums=('dbe2f2bf3ba0307d75885b21d6cceb2c')

prepare() {
cd ${_pkgname}-${pkgver}
rm bootstrap
}

build() {
export CC='gcc -m32'
export CXX='g++ -m32'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

cd ${_pkgname}-${pkgver}
NOCONFIGURE=1 autoreconf -i
./configure --prefix=/usr --libdir=/usr/lib32
make -j1
}

package() {
make -C ${_pkgname}-${pkgver} DESTDIR="${pkgdir}" install

cd ${pkgdir}/usr/
rm -rf {bin,include,share}

}