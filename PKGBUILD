# Maintainer:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.15
_pkgbase=caja
pkgname="${_pkgbase}-1.15-gtk3"
pkgver=${_ver}.1
pkgrel=1
pkgdesc="File manager for the MATE desktop"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}-gtk3")
license=('GPL')
depends=('dbus' 'desktop-file-utils' 'exempi' 'glib2' 'gtk3' 'gtk-update-icon-cache'
         'gvfs' 'libexif' 'libunique3' 'libxt' 'mate-desktop-1.15-gtk3' 'shared-mime-info'
         'startup-notification')
makedepends=('gobject-introspection' 'mate-common')
optdepends=('gstreamer: automatic media playback when mouseover'
            'gvfs-smb: To connect to Samba/Windows shares')
groups=('mate')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('5aef36806409593d4f50b788bbe81180185b1093')

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
        --enable-unique \
        --enable-introspection \
        --disable-static \
        --disable-update-mimedb
    make
}

package() {
    pkgdesc+=' (GTK3 version)'
    cd "${srcdir}/${_pkgbase}-gtk3"
    make DESTDIR="${pkgdir}" install
}
