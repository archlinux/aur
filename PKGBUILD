# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.15
_pkgbase=mate-settings-daemon
pkgname="${_pkgbase}-${_ver}-gtk3"
pkgver=${_ver}.1
pkgrel=1
pkgdesc="The MATE Settings daemon"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL')
depends=('dbus-glib' 'dconf' 'fontconfig' 'glib2' 'gtk3' 'gtk-update-icon-cache'
         'libcanberra-pulse' 'libmatekbd-1.15-gtk3' 'libmatemixer' 'libnotify'
         'libxt' 'mate-desktop-1.15-gtk3' 'nss' 'polkit')
makedepends=('mate-common-1.15-gtk3' 'gtk3' 'libmatekbd-1.15-gtk3' 'mate-desktop-1.15-gtk3')
groups=('mate')
replaces=("${_pkgbase}-gstreamer" "${_pkgbase}-pulseaudio")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3" "${_pkgbase}-gstreamer" "${_pkgbase}-pulseaudio")
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('a100e09d181b9fcb5633576e561c5e3591a20826')

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
