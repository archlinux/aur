# Maintainer: Niklas <dev@n1klas.net>

pkgname='libhomegear-base'
pkgdesc='Homegear base library'
pkgver=0.7.15
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('LGPL3')
url="https://homegear.eu"
depends=('gcc-libs')
source=("https://github.com/Homegear/libhomegear-base/archive/${pkgver}.tar.gz")
sha512sums=('8404f30a7bf7925b3f962eb3ae97f35da6d9faa23bd7c9a6d310889bb407123c91cc0477f873d3cbdb006de605d1018d35f6c4a3a715f4777da2e770e62b96ee')

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
