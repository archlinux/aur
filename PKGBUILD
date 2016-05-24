# Maintainer: Yuexuan Gu <lastavengers@outlook.com>

pkgname=ricin
_pkgname=Ricin
pkgver=0.1.1
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
sha256sums=('2cb3da187a973f08487da7401fc79d5f3c6b23a3010cfa2a57f077cd8a0c2e41')
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
