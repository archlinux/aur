# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Tobias Kieslich <tobias funnychar archlinux.org>

_pkgbase=xfce4-power-manager
pkgname=(${_pkgbase}-gtk2)
pkgver=1.4.4
pkgrel=1
pkgdesc="A power manager for Xfce (GTK2 version)"
arch=('x86_64')
url="https://www.xfce.org/"
license=('GPL2')
groups=('xfce4-gtk2')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
depends=('libxfce4ui-gtk2' 'upower' 'libnotify' 'hicolor-icon-theme')
optdepends=('xfce4-panel-gtk2: for the Xfce panel plugin')
makedepends=('intltool' 'xfce4-panel')
source=(https://archive.xfce.org/src/xfce/${_pkgbase}/${pkgver%.*}/${_pkgbase}-${pkgver}.tar.bz2)
sha256sums=('c50ec8aa7e7848c57c0f856dceb8132eb5f37585f0ac1627459ab8c882c73b07')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"

    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --sbindir=/usr/bin \
        --libexecdir=/usr/lib \
        --localstatedir=/var \
        --disable-network-manager \
        --enable-polkit \
        --disable-debug
    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
