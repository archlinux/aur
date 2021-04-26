# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
_pkgname="Shortwave"
pkgname="shortwave"
pkgver="2.0.1"
pkgrel="1"
epoch="1"
pkgdesc="Find and listen to internet radio stations."
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/${_pkgname}"
license=('GPL3')
depends=('gst-plugins-bad' 'libadwaita' 'libsoup')
makedepends=('cmake' 'git' 'gst-plugins-base-libs' 'meson' 'rust')
options=('!emptydirs')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('65dd02f7ad0b286613eae5d2f86adf9e8725ddc7885dd8658b2863cf13c6e594')

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
