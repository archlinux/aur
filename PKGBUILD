# Maintainer: Varakh <varakh at varakh dot de>
# Revived from: Rasmus Steinke <rasi at xssn dot at>
# Revived from: Vincent Berset <msieurhappy@gmail.com>

pkgname=mpd-sima
pkgver=0.14.3
pkgrel=2
pkgdesc="Automagically add title to mpd playlist based on last.fm recomendations"
arch=('any')
url="http://kaliko.me/code/mpd-sima/"
license=('GPL')
depends=('python>=3.2' 'python-musicpd>=0.4.0' 'python-requests>=2.2.0')
makedepends=('python-setuptools')
source=("http://media.kaliko.me/src/sima/releases/MPD_sima-$pkgver.tar.xz" "mpd-sima@.service")

package() {

    # Setup
    cd "${srcdir}/MPD_sima-${pkgver}"
    /usr/bin/env python setup.py install --prefix=/usr --root="$pkgdir" || return 1

    # Install systemd service
    install -D -m644 "${srcdir}/mpd-sima@.service" \
      "${pkgdir}/usr/lib/systemd/system/mpd-sima@.service"
}

md5sums=('c8a21d4845a59bd7b1472e87a1c6780a'
         '04e80db177aa9b0a2ea6da0d8fa99201')
