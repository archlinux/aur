# Maintainer: Varakh <varakh at varakh dot de>
# Revived from: Rasmus Steinke <rasi at xssn dot at>
# Revived from: Vincent Berset <msieurhappy@gmail.com>

pkgname=mpd-sima
pkgver=0.14.1
pkgrel=8
pkgdesc="Automagically add title to mpd playlist based on last.fm recomendations"
arch=('any')
url="http://kaliko.me/code/mpd-sima/"
license=('GPL')
depends=('python>=3.2' 'python-musicpd>=0.4.0' 'python-requests>=2.2.0')
makedepends=('python-setuptools')
source=("http://media.kaliko.me/src/sima/releases/MPD_sima-$pkgver.tar.xz" "mpd-sima@.service" "duration.patch")

prepare() {
  cd "${srcdir}/MPD_sima-${pkgver}"
  patch -Np1 -i "${srcdir}/duration.patch"
}

package() {

    # Setup
    cd "${srcdir}/MPD_sima-${pkgver}"
    /usr/bin/env python setup.py install --prefix=/usr --root="$pkgdir" || return 1

    # Install systemd service
    install -D -m644 "${srcdir}/mpd-sima@.service" \
      "${pkgdir}/usr/lib/systemd/system/mpd-sima@.service"
}

md5sums=('81368753f1d696276e850a9e86dcc060' '04e80db177aa9b0a2ea6da0d8fa99201' 'daa563e97dbcdef5aeaa1821081673d9')
