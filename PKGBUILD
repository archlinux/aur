# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
_pkgname="Shortwave"
pkgname="shortwave"
pkgver="7.2"
pkgrel="1"
pkgdesc="Find and listen to internet radio stations."
arch=('any')
url="https://gitlab.gnome.org/World/Shortwave"
license=('GPL3')
depends=('gstreamer' 'libhandy')
makedepends=('cargo' 'gobject-introspection' 'libdazzle' 'libhandy' 'meson' 'rust')
options=('!emptydirs')
provides=("${pkgname}")
conflicts=("${pkgname}"-git)
source=("Shortwave-v${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/Shortwave-v${pkgver}.tar.gz")
sha256sums=('0417004126069ad693b1a0afa622cb6edf330aafcd98642577dac230e43cfc16')

build() {
    cd "${_pkgname}-v${pkgver}"
    arch-meson builddir --prefix=/usr
    ninja -C builddir
}

package() {
    cd "${_pkgname}-v${pkgver}"
    DESTDIR="${pkgdir}" ninja -C builddir install

	install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
