# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.21
_pkgbase=caja
pkgname="${_pkgbase}-dev"
pkgver=${_ver}.3
pkgrel=5
pkgdesc="File manager for the MATE desktop"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL')
depends=('dbus' 'desktop-file-utils' 'exempi' 'glib2' 'gtk3' 'gtk-update-icon-cache'
         'gvfs' 'libexif' 'libunique3' 'libxt' 'mate-desktop>=1.21' 'shared-mime-info'
         'startup-notification')
makedepends=('gobject-introspection' 'mate-common>=1.21')
optdepends=('gstreamer: automatic media playback when mouseover'
            'gvfs-smb: To connect to Samba/Windows shares')
groups=('mate')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('bdae99b876be4d65425650ec3f524eb5cb6bfe96')

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
