# Maintainer:   Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>
# Contributor:  eadrom <eadrom@archlinux.info>
# Contributor:  Martin Wimpress <code@flexion.org>

_ver=1.21
_pkgbase=mate-control-center
pkgname="${_pkgbase}-dev"
pkgver=${_ver}.3
pkgrel=5
pkgdesc="The Control Center for MATE"
url="http://mate-desktop.org"
arch=('i686' 'x86_64')
provides=("${_pkgbase}" "${_pkgbase}-gtk3")
conflicts=("${_pkgbase}" "${_pkgbase}-gtk3")
license=('GPL')
depends=('dbus-glib' 'dconf' 'desktop-file-utils' 'glib2' 'gsettings-desktop-schemas'
         'gtk3' 'gtk-update-icon-cache' 'mate-desktop>=1.21' 'mate-menus>=1.21'
         'mate-settings-daemon>=1.21' 'marco>=1.21' 'libgtop' 
         'libmatekbd>=1.21' 'libunique3' 'librsvg' 'libxss' 'libxt'
         'shared-mime-info' 'startup-notification')
makedepends=('docbook2x' 'mate-common>=1.21' 'yelp-tools' 'libmatekbd' 'libunique3'
             'marco' 'mate-desktop>=1.21' 'mate-settings-daemon')
optdepends=('yelp: for reading MATE help documents')
groups=('mate')
source=("http://pub.mate-desktop.org/releases/${_ver}/${_pkgbase}-${pkgver}.tar.xz")
sha1sums=('d767dfcc96aedbce7fa2dae6ec50c1ec60e8e71b')

prepare() {
    cd "${srcdir}"
    mv "${_pkgbase}-${pkgver}" "${_pkgbase}-gtk3"
}

build() {
    cd "${srcdir}/${_pkgbase}-gtk3"
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --sbindir=/usr/bin \
        --localstatedir=/var \
        --with-gtk=3.0 \
        --disable-static \
        --disable-update-mimedb
    make
}

package() {
    pkgdesc+=' (GTK3 version)'

    cd "${srcdir}/${_pkgbase}-gtk3"
    make DESTDIR="${pkgdir}" install
    rm -f "${pkgdir}/usr/share/applications/mimeinfo.cache"
}
