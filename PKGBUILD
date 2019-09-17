# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.23
_pkgbase=pluma
pkgname="${_pkgbase}-dev"
pkgver=${_ver}.2
pkgrel=5
pkgdesc="A powerful text editor for MATE (GTK3 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL')
depends=('desktop-file-utils' 'enchant' 'glib2' 'gtk3' 'gtksourceview2' 'iso-codes'
         'libsm' 'mate-desktop-dev' 'gtksourceview3' 'python2-gobject' 'zenity' 'libpeas')
makedepends=('mate-common-dev' 'yelp-tools' 'gtksourceview3' 'mate-desktop-dev')
optdepends=('yelp: for reading MATE help documents')
groups=('mate-extra')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('9b070e225f1d938ff1f0e3974b09038293c29668')

prepare() {
    cd "${srcdir}"
    mv "${_pkgbase}-${pkgver}" "${_pkgbase}-gtk3"
    cd "${srcdir}/${_pkgbase}-gtk3"
    sed -i 's/python/python2/' plugins/externaltools/data/switch-c.tool.in
}

build() {
    cd "${srcdir}/${_pkgbase}-gtk3"
    PYTHON=/usr/bin/python2 ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgbase} \
        --with-gtk=3.0 \
        --enable-gtk-doc=no \
        --disable-python
    make
}

package() {
    cd "${srcdir}/${_pkgbase}-gtk3"
    make DESTDIR="${pkgdir}" install
}
