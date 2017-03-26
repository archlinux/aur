# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: Matthias Maennich <arch at maennich dot net>
# Contributor: Leonid Selivanov <bravebug at gmail dot com>

_pkgname="liferea"
_pkgver="1.12"
_prerelease="rc3"

pkgname="${_pkgname}-unstable"
pkgver="${_pkgver}.${_prerelease}"
pkgrel=1
pkgdesc="A desktop news aggregator for online news feeds and weblogs - Unstable"
arch=('i686' 'x86_64')
url="http://lzone.de/liferea/"
license=('GPL')
depends=('webkit2gtk' 'libnotify' 'json-glib' 'libpeas' 'desktop-file-utils' 'gobject-introspection' 'python2-gobject')
makedepends=('pkgconfig' 'diffutils' 'intltool')
optdepends=(
    'gnome-keyring: for keyring plugin support'
    'libgnome-keyring: for keyring plugin support'
    'gst-plugins-base: for media player plugin support'
    'gst-plugins-good: for media player plugin support'
    'gst-plugins-bad: for media player plugin support')
options=('!libtool' '!emptydirs')
provides=('liferea')
conflicts=('liferea' 'liferea-git')
source=("https://github.com/lwindolf/${_pkgname}/archive/v${_pkgver}-${_prerelease}.tar.gz")
sha256sums=('b5e5b828cbb76fc4d7d43b300af8e68f3914de5ed0d4a665b71d89e74d1fec1a')

build() {
    cd "${_pkgname}-${_pkgver}-${_prerelease}"
    ./autogen.sh
    ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-schemas-compile

    make ${MAKEFLAGS}
}

package() {
    cd "${_pkgname}-${_pkgver}-${_prerelease}"
    make DESTDIR="${pkgdir}" install
}

# vim:set ts=4 sw=2 ft=sh et:
