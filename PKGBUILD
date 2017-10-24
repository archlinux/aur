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
sha512sums=('b9f8597412a525e6e0f8c385ed9ec127fc01c9798cde50ea1393126276cf8f2189108159d701b80df98c9d637c9b39c898b5f4e9291d4962ee38be3c320badb5'
            'f29886f4833c96a2fd3bb7d46be33eb2a7635ab7912a648ea19b45d37aa9de572c728c768d45af2fda821145e4fbd3a70674687faf0be8d0ca5784e12feb5906')

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
