# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Martin Wimpress <code@flexion.org>

_ver=1.16
_pkgbase=mate-desktop
pkgname=(${_pkgbase}-gtk2)
pkgver=${_ver}.2
pkgrel=2
pkgdesc="Library with common API for various MATE modules (GTK2 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
options=('!emptydirs')
depends=('dconf' 'gtk2' 'mate-desktop-schemas-gtk2' 'startup-notification')
makedepends=('gobject-introspection' 'intltool')
groups=('mate-gtk2')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
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
    make DESTDIR="${pkgdir}" install
    make -C schemas DESTDIR="${pkgdir}" uninstall
}
