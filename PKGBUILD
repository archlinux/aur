# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Martin Wimpress <code@flexion.org>

_ver=1.16
_pkgbase=mate-utils
pkgname=(${_pkgbase}-gtk2)
pkgver=${_ver}.0
pkgrel=2
pkgdesc="Common MATE utilities for viewing disk usage, logs and fonts, taking screenshots, managing dictionaries and searching files (GTK2 version)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2' 'mate-desktop-schemas-gtk2' 'libcanberra' 'libgtop' 'libsm')
makedepends=('intltool' 'itstool' 'mate-panel-gtk2')
optdepends=('mate-panel-gtk2: Look up words in dictionaries from the panel')
groups=('mate-extra-gtk2')
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('8435a42773bd2f5fcf27e2e6e71373fbf216eef9')

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgbase} \
        --with-gtk=2.0 \
        --sysconfdir=/etc \
        --disable-maintainer-flags

    #https://bugzilla.gnome.org/show_bug.cgi?id=656231
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
