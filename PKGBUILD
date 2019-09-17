# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.23
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
         'libcanberra-pulse' 'libmatekbd-dev' 'libmatemixer-dev' 'libnotify'
         'libxt' 'mate-desktop-dev' 'nss' 'polkit')
makedepends=('mate-common-dev' 'gtk3' 'libmatekbd-dev' 'mate-desktop-dev')
groups=('mate')
replaces=("${_pkgbase}-gstreamer" "${_pkgbase}-pulseaudio")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3" "${_pkgbase}-gstreamer" "${_pkgbase}-pulseaudio")
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('8c88f2b83b6d0500afae9e5700b55adb2fd082d2')

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
