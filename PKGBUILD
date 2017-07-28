# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Martin Wimpress <code@flexion.org>

_ver=1.14
_pkgbase=libmatekbd
pkgname=(${_pkgbase}-gtk2)
pkgver=${_ver}.1
pkgrel=2
pkgdesc="MATE keyboard library (GTK2 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('dconf' 'gtk2' 'libxklavier')
makedepends=('intltool')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('71fcb3a85ead07dcbb7f4ac3516590dd03ba483f')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --with-gtk=2.0

    #https://bugzilla.gnome.org/show_bug.cgi?id=656231
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
