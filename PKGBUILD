# Maintainer: Eivind Eide <xenofil AT gmail DOT com>
# Contributor: Martin Wimpress <code AT flexion DOT org>
# Contributor: György Balló <ballogyor+arch AT gmail DOT com>

pkgname=mate-applet-lockkeys
pkgver=0.4.0
pkgrel=1
pkgdesc="A MATE panel applet that shows which of the CapsLock, NumLock and ScrollLock keys are on and which are off."
url="https://github.com/rezso/mate-applet-lockkeys"
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=('gtk3' 'mate-panel')
makedepends=('mate-common' 'perl-xml-parser' 'yelp-tools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('beb0ee598d7fd623a7e9daee2a10eef5ca40445a47d72b042f4ecc2786b4246e')

prepare() {
    cd "${pkgname}-${pkgver}"
    ./autogen.sh
}

build() {
    cd "${pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${pkgname}
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    rm -f "${pkgdir}/usr/share/glib-2.0/schemas/gschemas.compiled"
}
