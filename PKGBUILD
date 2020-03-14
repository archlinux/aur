# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: Matthias Maennich <arch at maennich dot net>
# Contributor: Leonid Selivanov <bravebug at gmail dot com>

_pkgname="liferea"
_pkgver="1.13.0"
#_prerelease="rc3"

pkgname="${_pkgname}-unstable"
#pkgver="${_pkgver}.${_prerelease}"
pkgver="${_pkgver}"
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
#source=("https://github.com/lwindolf/${_pkgname}/archive/v${_pkgver}-${_prerelease}.tar.gz")
source=("https://github.com/lwindolf/${_pkgname}/archive/v${_pkgver}.tar.gz")
sha256sums=('1be6c84780166dae261832ce1c4df0cd428a02ef045af4d952a52e77a60839dc')

build() {
    #cd "${_pkgname}-${_pkgver}-${_prerelease}"
    cd "${_pkgname}-${_pkgver}"
    ./autogen.sh
    ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-schemas-compile

    make ${MAKEFLAGS}
}

package() {
    #cd "${_pkgname}-${_pkgver}-${_prerelease}"
    cd "${_pkgname}-${_pkgver}"
    make DESTDIR="${pkgdir}" install
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
