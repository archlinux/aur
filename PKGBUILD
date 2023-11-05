# Maintainer: knedl1k <knedl1k At tuta Dot io>
# Contributor: yukichan

pkgname=yuki-iptv
pkgver=0.0.7
pkgrel=1
pkgdesc="IPTV player with EPG support (Astroncia IPTV fork)"
arch=('any')
url="https://github.com/yuki-iptv/yuki-iptv"
license=('GPL3')
makedepends=('make')
depends=('python' 'qt6-base' 'mpv' 'python-pyqt6' 'python-pillow' 'python-gobject' 'python-unidecode' 
         'python-requests' 'python-chardet' 'python-setproctitle' 'python-pydbus' 'python-wand' 'ffmpeg')
optdepends=('yt-dlp: YouTube channel support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('56bd1b67af94f9c4b03e7d7489dd468363101aa6db61e4ef340e6fb00d38b8d7')

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
