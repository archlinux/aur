# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: Matthias Maennich <arch at maennich dot net>
# Contributor: Leonid Selivanov <bravebug at gmail dot com>

_pkgname="liferea"

pkgname="${_pkgname}-unstable"
pkgver=1.11.5
pkgrel=3
pkgdesc="A desktop news aggregator for online news feeds and weblogs - Unstable"
arch=('i686' 'x86_64')
url="http://lzone.de/liferea/"
license=('GPL')
depends=('webkitgtk' 'libnotify' 'json-glib' 'libpeas' 'desktop-file-utils' 'gobject-introspection' 'python2-gobject')
makedepends=('pkgconfig' 'diffutils' 'intltool')
optdepends=('gnome-keyring: for keyring plugin support'
            'libgnome-keyring: for keyring plugin support'
            'gst-plugins-base: for media player plugin support'
    	    'gst-plugins-good: for media player plugin support'
    	    'gst-plugins-bad: for media player plugin support')
options=('!libtool' '!emptydirs')
provides=('liferea')
conflicts=('liferea' 'liferea-git')
install="${pkgname}.install"
source=("https://github.com/lwindolf/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('25d4c2cd0fa9aa0deaa33c2b9ccd9b7a9e48a2b20848398c2249c6ae72bb6907')

build() {
    cd "${_pkgname}-${pkgver}"

    ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-schemas-compile

    make ${MAKEFLAGS}
}

package() {
    cd "${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
