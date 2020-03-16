# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
_pkgname="Shortwave"
pkgname="shortwave"
pkgver="1.0.1"
pkgrel="1"
epoch="1"
pkgdesc="Find and listen to internet radio stations."
arch=('any')
url="https://gitlab.gnome.org/World/${_pkgname}"
license=('GPL3')
depends=('gst-plugins-bad' 'libhandy' 'libsoup' 'gtk3')
makedepends=('cargo' 'git' 'gobject-introspection' 'gst-plugins-base-libs' 'libdazzle' 'meson' 'rust')
options=('!emptydirs')
conflicts=("${pkgname}"-git)
source=("${_pkgname}-${pkgver}.tar.gz::${url}/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('8964f74c1f85c55b33ddab42dd00e8a48abd9b9b1fc425980e2ffd19b77879e0')

build() {
    cd "${_pkgname}-${pkgver}"
    arch-meson builddir --prefix=/usr
    ninja -C builddir
}

check() {
    cd "${_pkgname}-${pkgver}"
    ninja -C builddir test
}

package() {
    cd "${_pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" ninja -C builddir install

    install -D -m644 COPYING.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
