# Maintainer: Rasmus Steinke <rasi at xssn dot at>
# Revived from: Vincent Berset <msieurhappy@gmail.com>

pkgname=mpd-sima
pkgver=0.14.1
pkgrel=1
pkgdesc="Automagically add title to mpd playlist based on last.fm recomendations"
arch=('any')
url="http://codingteam.net/project/sima"
license=('GPL')
depends=('python-musicpd')
makedepends=('python-setuptools')
source=("http://codingteam.net/project/sima/download/file/mpd_sima-$pkgver.tar.xz"
        "mpd-sima.service")

build() {
    cd "${srcdir}/MPD_sima-${pkgver}"

    sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' \
        mpd-sima simadb_cli
}

package() {
    cd "${srcdir}/MPD_sima-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir" || return 1
    install -Dm644 ${srcdir}/mpd-sima.service ${pkgdir}/usr/lib/systemd/user/mpd-sima.service
}

md5sums=('81368753f1d696276e850a9e86dcc060'
         'c3b52d8a8a0fcf02f2c6ff5a9d831d5a')
