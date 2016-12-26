# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgbase=transmission
pkgname=transmission-cli-nodaemon-old
pkgver=2.92
pkgrel=1
pkgdesc="Fast, easy, and free BitTorrent client (CLI tools and web client). This version does not include the daemon and thus does not use the transmission user."
arch=('i686' 'x86_64')
url="https://www.transmissionbt.com/"
license=('MIT')
depends=('curl' 'libevent')
makedepends=('intltool')
conflicts=('transmission-cli')
provides=('transmission-cli')
source=("https://github.com/${pkgbase}/${pkgbase}-releases/raw/master/${pkgbase}-${pkgver}.tar.xz")
sha256sums=('3a8d045c306ad9acb7bf81126939b9594553a388482efa0ec1bfb67b22acd35f')

prepare() {
    cd ${pkgbase}-${pkgver}
    rm -f m4/glib-gettext.m4
    autoreconf -fi
}

build() {
    cd ${pkgbase}-${pkgver}
    ./configure --prefix=/usr --enable-cli --disable-daemon
    make
}

package_transmission-cli-nodaemon-old() {
    cd ${pkgbase}-${pkgver}

    for dir in cli utils; do
        make -C ${dir} DESTDIR="${pkgdir}" install
    done

    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
