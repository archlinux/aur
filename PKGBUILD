# Maintainer: Yuexuan Gu <lastavengers@outlook.com>

pkgname=ricin
_pkgname=Ricin
pkgver=0.0.6
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
         'libconfig'
         )

source=("https://github.com/RicinApp/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a6b328f772eb81824c859528ff0b08782d4ead993e87d74f64ec17fd6bd6ad14')
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
