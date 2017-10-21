# Maintainer: Niklas <dev@n1klas.net>

pkgname='libhomegear-base'
pkgdesc='Homegear base library'
pkgver=0.7.10
pkgrel=1
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
license=('LGPL3')
url="https://homegear.eu"
depends=('gcc-libs')
source=("https://github.com/Homegear/libhomegear-base/archive/${pkgver}.tar.gz"
        'libhomegear-base-version.patch')
sha512sums=('2fb3dcf75996645fb8519b45951c299e51e4dae48630079782e5016ad1eb1013b7d528217046c5d80e4879a090aaaa4b7125a402321a4fb4258f481deed0fac3'
            'c87848d6c26cc727963dbb5335b94f9a219c21e60fbc6b816b33a53a55b95d94c7961482891a1b70f6e9293b555a0b67321b5a2c3df90d70454be9b1f2dacfd7')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    patch -p1 -i "${srcdir}/libhomegear-base-version.patch"
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
