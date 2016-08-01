# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.15
_pkgbase=mate-utils
pkgname="${_pkgbase}-${_ver}-gtk3"
pkgver=${_ver}.0
pkgrel=1
pkgdesc="Common MATE utilities for viewing disk usage, logs and fonts, taking screenshots, managing dictionaries and searching files"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL')
depends=('desktop-file-utils' 'glib2' 'gtk3' 'gtk-update-icon-cache'
         'libcanberra' 'libgtop' 'libsm' 'zlib')
makedepends=('mate-common' 'mate-panel-1.15-gtk3' 'rarian' 'yelp-tools' 'gtk3')
optdepends=('mate-panel: Look up words in dictionaries from the panel'
            'yelp: for reading MATE help documents')
groups=('mate-extra')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('20c863e3bc944cb291edb734389079a1330bc6cc')

prepare() {
    cd "${srcdir}"
    mv "${_pkgbase}-${pkgver}" "${_pkgbase}-gtk3"
}

build() {
    cd "${srcdir}/${_pkgbase}-gtk3"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgbase} \
        --with-gtk=3.0 \
        --sysconfdir=/etc \
        --enable-deprecated \
        --disable-maintainer-flags \
        --disable-static
    make
}

package() {
    pkgdesc+=' (GTK3 version)'
    cd "${srcdir}/${_pkgbase}-gtk3"
    make DESTDIR="${pkgdir}" install
}
