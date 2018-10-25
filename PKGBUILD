# Maintainer: Niklas <dev@n1klas.net>

pkgname='libhomegear-ipc'
pkgdesc='Library to create IPC clients for Homegear'
pkgver=0.7.30
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('LGPL3')
url="https://homegear.eu"
depends=('gcc-libs')
source=("https://github.com/Homegear/libhomegear-ipc/archive/${pkgver}.tar.gz")
sha512sums=('cdbf1d21508ee0f23c12f3b0c2dff262039adc9a587dd8fd2a13be0f78bc553efefc6be23a71e7726461ac7dc86814a8506123b80de303009363fcb98eeade87')

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
