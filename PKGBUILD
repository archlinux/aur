# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.15
_pkgbase=mate-applets
pkgname="${_pkgbase}-${_ver}-gtk3"
pkgver=${_ver}.1
pkgrel=1
pkgdesc="Applets for MATE panel"
arch=('i686' 'x86_64')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
url="http://mate-desktop.org"
license=('GPL')
depends=('glib2' 'gtksourceview2' 'gtk-update-icon-cache' 'libgtop' 'libnotify'
         'mate-panel-1.15-gtk3' 'polkit' 'python2-dbus' 'python2-gobject' 'upower')
makedepends=('docbook2x' 'docbook-xsl' 'mate-common' 'yelp-tools' 'gtksourceview3' 'mate-panel-1.15-gtk3')
optdepends=('fortune-mod: for displaying fortune cookies in the Wanda the Fish applet'
            'yelp: for reading MATE help documents')
groups=('mate-extra')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('e1464e32d9c9d0e06898e41c80812d89b0ca49db')

prepare() {
    cd "${srcdir}"
    mv "${_pkgbase}-${pkgver}" "${_pkgbase}-gtk3"
    cd "${srcdir}/${_pkgbase}-gtk3"
    sed -i 's/env python/env python2/' invest-applet/invest/{chart.py,invest-applet.py,mate-invest-chart}
}

build() {
    cd "${srcdir}/${_pkgbase}-gtk3"
    PYTHON=/usr/bin/python2 ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib/${_pkgbase} \
        --enable-polkit \
        --enable-ipv6 \
        --with-gtk=3.0 \
        --disable-static
    make
}

package() {
    pkgdesc+=' (GTK3 version)'
    cd "${srcdir}/${_pkgbase}-gtk3"
    make DESTDIR="${pkgdir}" install
}
