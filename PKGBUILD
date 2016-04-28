# Maintainer: Yuexuan Gu <lastavengers@outlook.com>

pkgname=ricin
_pkgname=Ricin
pkgver=0.0.7
pkgrel=1
pkgdesc="A dead-simple but powerful Tox client."
url="https://github.com/RicinApp/Ricin"
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('git' 'meson-git' 'ninja' 'vala')
depends=('gtk3'
         'toxcore'
         'glib2'
         'json-glib'
         'libsoup'
         'libnotify'
         )

source=("https://github.com/RicinApp/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('861a403fec1206323c34c71dff92c29bdffea97e21617e8b02bdb0bc00301698')
provides=('ricin')
conflicts=('ricin')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    make autogen
    make release

    cd build
    mesonconf.py -Dprefix=/usr
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    make DESTDIR=$pkgdir install
    # cover ${pkgdir}/usr/bin/Ricin"
    install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/ricin"
}
