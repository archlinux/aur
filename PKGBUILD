# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.21
_pkgbase=pluma
pkgname="${_pkgbase}-dev"
pkgver=${_ver}.3
pkgrel=5
pkgdesc="A powerful text editor for MATE (GTK3 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL')
depends=('desktop-file-utils' 'enchant' 'glib2' 'gtk3' 'gtksourceview2' 'iso-codes'
         'libsm' 'mate-desktop>=1.21' 'gtksourceview3' 'python2-gobject' 'zenity' 'libpeas')
makedepends=('mate-common>=1.21' 'yelp-tools' 'gtksourceview3' 'mate-desktop>=1.21')
optdepends=('yelp: for reading MATE help documents')
groups=('mate-extra')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('f638b1bf559bd17133add9afaccb42597d7bf2fe')

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
