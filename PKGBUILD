# Maintainer: douglarek

pkgname=yuki-iptv-fork
pkgver=0.0.12
pkgrel=1
pkgdesc="IPTV player with EPG support"
arch=('any')
url="https://codeberg.org/liya/yuki-iptv"
license=('GPL3')
makedepends=('make')
depends=('python' 'qt6-base' 'mpv' 'python-pyqt6' 'python-wand' 'python-gobject' 'python-unidecode' 'python-requests' 'python-chardet' 'python-setproctitle' 'ffmpeg')
optdepends=('yt-dlp: YouTube channel support')
provides=('yuki-iptv')
conflicts=('yuki-iptv')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('2ddb74cf0849b43985d791b0d38fb2f12c50276e49de496f8b7e25fdb34e44ac63537dc714bdf12bfd22d36498f82d2bcb20cdc55886e3d6d2c6d110f9ce5d57')

prepare() {
        cd "${pkgname::-5}"

        # Set version in About dialog
        sed -i "s/__DEB_VERSION__/${pkgver//+*/}/g" usr/lib/yuki-iptv/yuki-iptv.py
}

build() {
        cd "${pkgname::-5}"
        make
}

package() {
        cd "${pkgname::-5}"
        cp -r usr/ "$pkgdir/"
}
