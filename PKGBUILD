# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: Matthias Maennich <arch at maennich dot net>
# Contributor: Leonid Selivanov <bravebug at gmail dot com>

_pkgname="liferea"

pkgname="${_pkgname}-unstable"
pkgver=1.11.4
pkgrel=1
pkgdesc="A desktop news aggregator for online news feeds and weblogs - Unstable"
arch=('i686' 'x86_64')
url="http://lzone.de/liferea/"
license=('GPL')
depends=('webkitgtk' 'libnotify' 'json-glib' 'libpeas' 'desktop-file-utils')
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
sha256sums=('16b6a0cdddb13870d095ca55c1f00bf370e74248f29f21cb2c7ee90781ae42df')

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
