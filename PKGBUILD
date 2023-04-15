# Maintainer: yukichan

pkgname=yuki-iptv
pkgver=0.0.4
pkgrel=1
pkgdesc="IPTV player with EPG support"
arch=('any')
url="https://github.com/yuki-iptv/yuki-iptv"
license=('GPL3')
makedepends=('make')
depends=('python' 'qt6-base' 'mpv' 'python-pyqt6' 'python-pillow' 'python-gobject' 'python-unidecode' 'python-requests' 'python-chardet' 'python-setproctitle' 'python-pydbus' 'ffmpeg')
optdepends=('yt-dlp: YouTube channel support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('146d92c9b6dcee9713fd8ddd00b7446a0f3f7ac1cb18205a79a3e2f9e2a8b66bcc0042c9dd19d3dc65c650a90cfc2ee175f604112d8537cba9f9e86079498c78')

prepare() {
        cd "${pkgname}-${pkgver}"

        # Set version in About dialog
        sed -i "s/__DEB_VERSION__/${pkgver//+*/}/g" usr/lib/yuki-iptv/yuki-iptv.py
}

build() {
        cd "${pkgname}-${pkgver}"
        make
}

package() {
        cd "${pkgname}-${pkgver}"
        cp -r usr/ "$pkgdir/"
}
