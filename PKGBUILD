# Maintainer: Niklas <dev@n1klas.net>

pkgname='libhomegear-ipc'
pkgdesc='Library to create IPC clients for Homegear'
pkgver=0.7.27
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('LGPL3')
url="https://homegear.eu"
depends=('gcc-libs')
source=("https://github.com/Homegear/libhomegear-ipc/archive/${pkgver}.tar.gz")
sha512sums=('bb02d047351fe7e1abb2c3fd881772dd76853e0a63890da99a6ee024bb764708cbcb00aa67b0ea3aa4cd691d9f4f8c6277963971c9dd10675fe46668c573959d')

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
