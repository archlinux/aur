# Maintainer: Niklas <dev@n1klas.net>

pkgname='libhomegear-node'
pkgdesc='Base library for Homegear nodes'
pkgver=0.7.15
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('LGPL3')
url="https://homegear.eu"
depends=('gcc-libs')
source=("https://github.com/Homegear/libhomegear-node/archive/${pkgver}.tar.gz")
sha512sums=('5ee5cd6601d376d25568ff5d27f0ee1ec51c5436a1bfc18c9cabe834a242d454a82b8f54d6fedf4f56bedfdf085de05fe30a96d5893bcbaf1de281ad6c406c3d')

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
