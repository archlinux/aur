# Maintainer: Eivind Eide <xenofil AT gmail DOT com>
# Contributor: Martin Wimpress <code AT flexion DOT org>
# Contributor: György Balló <ballogyor+arch AT gmail DOT com>

pkgname=mate-applet-lockkeys
pkgver=0.3.2
pkgrel=1
pkgdesc="A MATE panel applet that shows which of the CapsLock, NumLock and ScrollLock keys are on and which are off."
url="http://www.zavedil.com/mate-lock-keys-applet/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk3' 'mate-panel')
makedepends=('mate-common' 'perl-xml-parser' 'yelp-tools')
source=("http://www.zavedil.com/wp-content/uploads/2017/06/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7ff42bc61a734abcf704cfb42f3b482f49138bc9839b50917b8b1257f0baaedd')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${pkgname}
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    rm -f "${pkgdir}/usr/share/glib-2.0/schemas/gschemas.compiled"
}
