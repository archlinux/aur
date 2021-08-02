# Maintainer: René Wagner <rwagner at rw-net dot de>
#
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Martin Wimpress <code@flexion.org>
#
pkgname="caja-dropbox"
pkgver="1.25.0"
pkgrel="2"
pkgdesc="Dropbox extension for Caja file manager "
arch=('i686' 'x86_64')
url="https://github.com/mate-desktop/caja-dropbox"
license=('custom:CC-BY-ND-3' 'GPL')
groups=('caja-extensions')
depends=('caja' 'glib2' 'libnotify' 'polkit' 'procps' 'pygtk' 'xdg-utils')
optdepends=('dropbox: Dropbox support')
makedepends=('mate-common' 'python-docutils')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c7e6356d794770923d338725846e3523676f2250ba99442a8afdc0f7ac24f9ac')

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
