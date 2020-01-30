# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.23
_pkgbase=mate-utils
pkgname="${_pkgbase}-dev"
pkgver=${_ver}.1
pkgrel=5
pkgdesc="Common MATE utilities for viewing disk usage, logs and fonts, taking screenshots, managing dictionaries and searching files"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL')
depends=('desktop-file-utils' 'glib2' 'gtk3' 'gtk-update-icon-cache'
         'libcanberra' 'libgtop' 'libsm' 'zlib')
makedepends=('mate-common-dev' 'mate-panel-dev' 'rarian' 'yelp-tools' 'gtk3')
optdepends=('mate-panel: Look up words in dictionaries from the panel'
            'yelp: for reading MATE help documents')
groups=('mate-extra')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('fc83c3913b6c3c8d27bfcff890e586b4ded34060')

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
