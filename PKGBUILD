# Maintainer: Yuexuan Gu <lastavengers@outlook.com>

pkgname=ricin
_pkgname=Ricin
pkgver=0.0.9
pkgrel=1
pkgdesc="A dead-simple but powerful Tox client."
url="https://ricin.im/"
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('git' 'vala' 'python')
depends=('gtk3'
         'toxcore'
         'glib2'
         'json-glib'
         'libsoup'
         'libnotify'
         )

source=("https://github.com/RicinApp/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('54389639b1f21690eb3650f1e6635363f5dbcf02ed4c9f28b7efc88c3b1522f4')
provides=('ricin')
conflicts=('ricin')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    ./waf distclean
    ./waf configure --prefix=${pkgdir}/usr --bindir=${pkgdir}/usr/bin
    ./waf build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./waf install

    # cover ${pkgdir}/usr/bin/Ricin"
    rm "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/ricin"
}
