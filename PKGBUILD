# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="caja-actions"
pkgver="1.8.3"
pkgrel="1"
pkgdesc="An extension for Caja,the MATE file manager, which allows the user to add arbitrary program to be launched through the popup menu of selected files."
arch=('i686' 'x86_64')
url="https://github.com/raveit65/caja-actions"
license=('GPL2')
groups=('caja-extensions')
depends=('caja' 'glib2' 'libgtop' 'libnotify' 'polkit' 'procps' 'pygtk' 'xdg-utils')
makedepends=('mate-common' 'yelp-tools' 'docbook-utils')
source=("${pkgname}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")

sha256sums=('7d756117eb00fc2857552ac330a49a815e6688c7850659b245759133057fa7b4')

build() {
    cd "${pkgname}-${pkgver}"
    NOCONFIGURE=1 ./autogen.sh
    ./configure \
        --prefix=/usr \
        --with-gtk=3 \
        --enable-html-manuals
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR=${pkgdir} install
    install -D -m 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=4 sw=4 ft=sh et syn=sh ft=sh
