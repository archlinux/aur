# Maintainer: Niklas <dev@n1klas.net>

pkgname='libhomegear-base'
pkgdesc='Homegear base library'
pkgver=0.7.10
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('LGPL3')
url="https://homegear.eu"
depends=('gcc-libs')
source=("https://github.com/Homegear/libhomegear-base/archive/${pkgver}.tar.gz")
sha512sums=('2fb3dcf75996645fb8519b45951c299e51e4dae48630079782e5016ad1eb1013b7d528217046c5d80e4879a090aaaa4b7125a402321a4fb4258f481deed0fac3')

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
