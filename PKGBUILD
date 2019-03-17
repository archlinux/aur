# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="fontfinder"
pkgver="1.4.1"
pkgrel="1"
pkgdesc='A Google font browser for your GTK desktop, written in Rust'
arch=('x86_64')
url="https://gitlab.com/mmstick/fontfinder"
license=('MIT')
depends=('webkit2gtk' 'openssl-1.0')
makedepends=('rust')
options=('!emptydirs')
provides=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ca37b974b30b9788e21f2301d0aac46f1db58aa43044db9017ef9c666512384e')

build() {
    cd "${pkgname}-${pkgver}"
    sed -i "s|usr/local|usr|g" Makefile
    export OPENSSL_INCLUDE_DIR=/usr/include/openssl-1.0
    export OPENSSL_LIB_DIR=/usr/lib/openssl-1.0
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR=${pkgdir} install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
