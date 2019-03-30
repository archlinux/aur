# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Martin Wimpress <code@flexion.org>
#
pkgname="caja-dropbox"
pkgver="1.22.0"
pkgrel="1"
pkgdesc="Dropbox extension for Caja file manager "
arch=('i686' 'x86_64')
url="https://github.com/mate-desktop/caja-dropbox"
license=('custom:CC-BY-ND-3' 'GPL')
groups=('caja-extensions')
depends=('caja' 'glib2' 'libnotify' 'polkit' 'procps' 'pygtk' 'xdg-utils')
optdepends=('dropbox: Dropbox support')
makedepends=('mate-common' 'python-docutils')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('400c6b9bc23ed873721d1885a4eeb3197b461372a01c270a28af4dfcf875239d')

prepare() {
  cd "${pkgname}-${pkgver}"
  autoreconf -fi
}

build() {
    cd "${pkgname}-${pkgver}"
    ./autogen.sh
    ./configure \
        --prefix=/usr \
        --disable-static
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -D -m 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=4 sw=4 ft=sh et syn=sh
