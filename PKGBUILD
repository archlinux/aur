# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Martin Wimpress <code@flexion.org>

_ver=1.16
_pkgbase=mate-desktop
pkgname=(${_pkgbase}-schemas-gtk2)
pkgver=${_ver}.2
pkgrel=2
pkgdesc="GSettings schemas for MATE Desktop (GTK2 version)"
url="http://mate-desktop.org"
arch=('any')
license=('GPL' 'LGPL')
options=('!emptydirs')
depends=('dconf')
makedepends=('gobject-introspection' 'intltool' 'gtk2')
groups=('mate-gtk2')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('8f8ee79eff741f4c6613cbf27c7639b10b0387eb')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --with-gtk=2.0 \
        --disable-schemas-compile

    #https://bugzilla.gnome.org/show_bug.cgi?id=656231
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make -C schemas DESTDIR="${pkgdir}" install
}
