# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="mate-notification-theme-slate"
pkgver=6.0
pkgrel=1
pkgdesc="A CSS-backed notification theme for the MATE Desktop.
         The fallback styling for this plugin emulates the Arc-styled Budgie notifications."
url="https://github.com/getsolus/${pkgname}"
arch=('i686' 'x86_64')
license=('LGPL2.1')
depends=('gtk3')
provides=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('53af73383fdb9d3cf1060b55666b7059737cd844cb6a09526ac09701f0ce290c')

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

# vim:set ts=4 sw=4 et syn=sh ft=sh:
