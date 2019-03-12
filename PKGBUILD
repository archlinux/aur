# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="mate-notification-theme-slate"
pkgver=5
pkgrel=2
pkgdesc="A CSS-backed notification theme for the MATE Desktop.
         The fallback styling for this plugin emulates the Arc-styled Budgie notifications."
url="https://github.com/getsolus/${pkgname}"
arch=('i686' 'x86_64')
license=('LGPL2.1')
depends=('gtk3')
provides=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v5.tar.gz")
sha256sums=('966f0fc81711ffd47213c2710cb4ccd0625895542c1c5439067048530abe5621')

build() {
    cd "${pkgname}-${pkgver}"
    ./autogen.sh --prefix=/usr
    make -j$(($(getconf _NPROCESSORS_ONLN)+1))
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR=${pkgdir} install

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=4 ft=sh et syn=sh ft=sh:
