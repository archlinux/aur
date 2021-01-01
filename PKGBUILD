# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: Matthias Maennich <arch at maennich dot net>
# Contributor: Leonid Selivanov <bravebug at gmail dot com>
#
_pkgname="liferea"
_pkgver="1.13.3"
#_prerelease="rc3"

pkgname="${_pkgname}-unstable"
#pkgver="${_pkgver}.${_prerelease}"
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="A desktop news aggregator for online news feeds and weblogs - Unstable"
arch=('i686' 'x86_64')
url="http://lzone.de/liferea/"
_url="https://github.com/lwindolf"
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
source=("${pkgname}-${_pkgver}.tar.gz::${_url}/${_pkgname}/archive/v${_pkgver}.tar.gz")
sha256sums=('42e1faf8860373b78640fd35b2636630fd8770059c61e535018b0683101d072d')

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
