# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.21
_pkgbase=mate-settings-daemon
pkgname="${_pkgbase}-dev"
pkgver=${_ver}.2
pkgrel=5
pkgdesc="The MATE Settings daemon"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL')
depends=('dbus-glib' 'dconf' 'fontconfig' 'glib2' 'gtk3' 'gtk-update-icon-cache'
         'libcanberra-pulse' 'libmatekbd>=1.21' 'libmatemixer>=1.21' 'libnotify'
         'libxt' 'mate-desktop>=1.21' 'nss' 'polkit')
makedepends=('mate-common>=1.21' 'gtk3' 'libmatekbd>=1.21' 'mate-desktop>=1.21')
groups=('mate')
replaces=("${_pkgbase}-gstreamer" "${_pkgbase}-pulseaudio")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3" "${_pkgbase}-gstreamer" "${_pkgbase}-pulseaudio")
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('602de55f54b637e6327a197e057a5d8a3b911393')

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
