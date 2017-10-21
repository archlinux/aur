# Maintainer: Niklas <dev@n1klas.net>

pkgname='libhomegear-node'
pkgdesc='Base library for Homegear nodes'
pkgver=0.7.10
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('LGPL3')
url="https://homegear.eu"
depends=('gcc-libs')
source=("https://github.com/Homegear/libhomegear-node/archive/${pkgver}.tar.gz"
        'libhomegear-node-version.patch')
md5sums=('eb87d1f9a512e9d764ade099d0a17949'
         '38f90c81f338aab87d044e1f6a27b8a8')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    patch -p1 -i "${srcdir}/libhomegear-node-version.patch"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    ./bootstrap
    ./configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc --libdir=/usr/lib
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make DESTDIR="${pkgdir}" install
}
