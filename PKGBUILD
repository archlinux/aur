# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: tobias <tobias funnychar archlinux.org>

_pkgbase=xfce4-appfinder
pkgname=(${_pkgbase}-gtk2)
pkgver=4.12.0
pkgrel=1
pkgdesc="An application finder for Xfce (GTK2 version)"
arch=('x86_64')
url="https://www.xfce.org/"
license=('GPL2')
groups=('xfce4-gtk2')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
depends=('libxfce4ui-gtk2' 'garcon' 'hicolor-icon-theme')
makedepends=('intltool')
source=(https://archive.xfce.org/src/xfce/${_pkgbase}/${pkgver%.*}/${_pkgbase}-${pkgver}.tar.bz2
        0001-Use-non-legacy-icon-names.patch)
sha256sums=('2ad4a58019a76a6b64a816050db25f96854917c2f2e89d6a9df6c18e6c84c567'
            'b829103bf33d6f1ec71e1448e469b1b1df3313f887a27b7479a7cbc67e06643f')

prepare() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"

    patch -Np1 -i ../0001-Use-non-legacy-icon-names.patch
}

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"

    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib \
        --localstatedir=/var \
        --disable-static \
        --disable-debug
    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
