# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.15
_pkgbase=mate-media
pkgname="${_pkgbase}-${_ver}-gtk3"
pkgver=${_ver}.0
pkgrel=1
url="http://mate-desktop.org"
pkgdesc="MATE Media Tools (GTK3 version)"
arch=('i686' 'x86_64')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL')
depends=('gtk3' 'libcanberra' 'libmatemixer' 'libunique3' 'mate-desktop-1.15-gtk3')
makedepends=('mate-common' 'gtk3' 'libunique3')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
groups=('mate-extra')
replaces=("${_pkgbase}-gstreamer" "${_pkgbase}-pulseaudio")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3" "${_pkgbase}-gstreamer" "${_pkgbase}-pulseaudio")
sha1sums=('13043b1dcf8e4fbe93dba44566eecd1e70870131')

prepare() {
    cd "${srcdir}"
    mv "${_pkgbase}-${pkgver}" "${_pkgbase}-gtk3"
}

build() {
    cd "${srcdir}/${_pkgbase}-gtk3"
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib/${_pkgbase} \
        --localstatedir=/var \
        --with-gtk=3.0 \
        --disable-static
    make
}

package() {
    cd "${srcdir}/${_pkgbase}-gtk3"
    make DESTDIR="${pkgdir}" install
}
