# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias funnychar archlinux.org>

_pkgbase=xfce4-panel
pkgname=(${_pkgbase}-gtk2)
pkgver=4.12.2
pkgrel=1
pkgdesc="Panel for the Xfce desktop environment (GTK2 version)"
arch=('x86_64')
url="https://www.xfce.org/"
license=('GPL2')
groups=('xfce4-gtk2')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
depends=('exo' 'garcon' 'libxfce4ui-gtk2' 'libwnck' 'hicolor-icon-theme'
         'desktop-file-utils')
makedepends=('intltool')
source=(https://archive.xfce.org/src/xfce/${_pkgbase}/${pkgver%.*}/${_pkgbase}-${pkgver}.tar.bz2)
sha256sums=('42058abb81b8f87691d3999627447de71c3285bcf055f308aab5cefab2de0ce9')

build() {
    cd "${srcdir}/${_pkgbase}-$pkgver"

    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib \
        --localstatedir=/var \
        --disable-static \
        --enable-gio-unix \
        --enable-gtk3 \
        --disable-debug
    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
