# Maintainer: Niklas <dev@n1klas.net>

pkgname='libhomegear-node'
pkgdesc='Base library for Homegear nodes'
pkgver=0.7.18
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('LGPL3')
url="https://homegear.eu"
depends=('gcc-libs')
source=("https://github.com/Homegear/libhomegear-node/archive/${pkgver}.tar.gz")
sha512sums=('e6c065f5fb7339c3af0c7e604bc089b75abcf111f1cbadd70cf9e5fe8594cafbdb3080a6bb7618b47b3b0f14617d6f27be07501869c91bc74c43bdd74be80b99')

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
