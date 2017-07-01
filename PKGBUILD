# Maintainer: Adel Qalieh <aqalieh95 at gmail dot com>

pkgname=xmltooling-c
pkgver=1.6.0
_opensamlver=2.6.0
pkgrel=1
pkgdesc='A lower-level library that provides a higher level interface to XML processing, particularly in light of signing and encryption'
arch=('i686' 'x86_64')
url="http://shibboleth.net/"
license=('Apache')

depends=('gcc-libs' 'openssl-1.0' 'curl' 'log4shib' 'xerces-c' 'boost' 'xml-security-c')
source=("http://shibboleth.net/downloads/c++-opensaml/${_opensamlver}/xmltooling-${pkgver}.tar.gz")
sha256sums=('c9e5143cb73529bd21cdf550d3e6e706b7ebbfc6e1241e5742a98618645dcef0')

prepare() {
    cd "${srcdir}/xmltooling-${pkgver}"

    PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig \
    CFLAGS+=" -I/usr/include/openssl-1.0" \
    LDFLAGS+=" -L/usr/lib/openssl-1.0 -lssl" \
    CXXFLAGS="-std=gnu++98" \
    ./configure
}

build() {
    cd "${srcdir}/xmltooling-${pkgver}"

    make
}

package() {
    cd "${srcdir}/xmltooling-${pkgver}"

    make DESTDIR="${pkgdir}" install
}
