# Maintainer: Niklas <dev@n1klas.net>

pkgname='libhomegear-base'
pkgdesc='Homegear base library'
pkgver=0.7.30
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('LGPL3')
url="https://homegear.eu"
depends=('gcc-libs')
source=("https://github.com/Homegear/libhomegear-base/archive/${pkgver}.tar.gz")
sha512sums=('feaf6933da5faa84e9da5f1f53be3d5f3c4c98e01566e4b72ad0e18ad9d4790364ceebea9d5c1648074926a903ff9c19a85c2ce7da042156d2420bd7e4513feb')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Use the our version number instead of the script which would have fetched it from Github
    sed -i -e "s#m4_esyscmd_s(\[./getVersion.sh\])#${pkgver}#" configure.ac
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
