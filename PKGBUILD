# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Martin Wimpress <code@flexion.org>

_ver=1.16
_pkgbase=mate-applets
pkgname=(${_pkgbase}-gtk2)
pkgver=${_ver}.0
pkgrel=2
pkgdesc="Applets for MATE panel (GTK2 version)"
arch=('i686' 'x86_64')
url="http://mate-desktop.org"
license=('GPL')
depends=('gtksourceview2' 'libgtop' 'libnotify' 'mate-panel' 'polkit'
         'python2-dbus' 'python2-gobject' 'upower' 'wireless_tools')
makedepends=('intltool' 'itstool')
optdepends=('fortune-mod: for displaying fortune cookies in the Wanda the Fish applet')
groups=('mate-extra-gtk2')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('6e6b51089bcb6450a466ba358b71fcfd7aba3a6a')

prepare() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    sed -i 's/env python/env python2/' invest-applet/invest/{chart.py,invest-applet.py,mate-invest-chart}
}

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    PYTHON=/usr/bin/python2 ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib/${_pkgbase} \
        --enable-polkit \
        --enable-ipv6 \
        --with-gtk=2.0
    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
