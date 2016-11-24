# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.17
_pkgbase=mate-settings-daemon
pkgname="${_pkgbase}"
pkgver=${_ver}.0
pkgrel=1
pkgdesc="The MATE Settings daemon"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL')
depends=('dbus-glib' 'dconf' 'fontconfig' 'glib2' 'gtk3' 'gtk-update-icon-cache'
         'libcanberra-pulse' 'libmatekbd>=1.17' 'libmatemixer>=1.17' 'libnotify'
         'libxt' 'mate-desktop>=1.17' 'nss' 'polkit')
makedepends=('mate-common>=1.17' 'gtk3' 'libmatekbd>=1.17' 'mate-desktop>=1.17')
groups=('mate')
replaces=("${_pkgbase}-gstreamer" "${_pkgbase}-pulseaudio")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3" "${_pkgbase}-gstreamer" "${_pkgbase}-pulseaudio")
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('24e8ff57d4a10a217a26d47b634412c38cba09db')

prepare() {
    cd "${srcdir}"
    mv "${_pkgbase}-${pkgver}" "${_pkgbase}-gtk3"
}

build() {
    cd "${srcdir}/${_pkgbase}-gtk3"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgbase} \
        --sysconfdir=/etc \
        --with-gtk=3.0 \
        --enable-polkit \
        --disable-static
    make
}

package() {
    pkgdesc+=' (GTK3 version)'
    cd "${srcdir}/${_pkgbase}-gtk3"
    make DESTDIR="${pkgdir}" install
}
