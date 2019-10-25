# Maintainer: ValHue <vhuelamo@gmail.com>
#
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Martin Wimpress <code@flexion.org>
#
pkgname="caja-dropbox"
pkgver="1.23.0"
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
sha256sums=('16eaddb5420dc1042ce46d97341dbbb91802760e16992491d5208166a4b59768')

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

# vim:set ts=4 sw=4 et syn=sh ft=sh:
