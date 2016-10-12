# Maintainer: Yuexuan Gu <lastavengers@outlook.com>

pkgname=ricin
_pkgname=Ricin
pkgver=0.2.4
pkgrel=1
pkgdesc="A dead-simple but powerful Tox client."
url="https://ricin.im/"
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('git' 'vala' 'python' 'intltool')
depends=('gtk3'
         'toxcore'
         'glib2'
         'json-glib'
         'libsoup'
         'libnotify'
         )

source=("https://github.com/RicinApp/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b394e4b076e89d4e5a6de0588dded434273eb2a5d982d6f0c5f55d38eaa9a25a')
provides=('ricin')
conflicts=('ricin-git')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    ./waf distclean
    ./waf configure --prefix=${pkgdir}/usr
    ./waf build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./waf install

    # cover ${pkgdir}/usr/bin/Ricin"
    rm "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/ricin"
}
