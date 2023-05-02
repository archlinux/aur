# Maintainer: yukichan

pkgname=yuki-iptv
pkgver=0.0.5
pkgrel=1
pkgdesc="IPTV player with EPG support"
arch=('any')
url="https://github.com/yuki-iptv/yuki-iptv"
license=('GPL3')
makedepends=('make')
depends=('python' 'qt6-base' 'mpv' 'python-pyqt6' 'python-pillow' 'python-gobject' 'python-unidecode' 'python-requests' 'python-chardet' 'python-setproctitle' 'python-pydbus' 'ffmpeg')
optdepends=('yt-dlp: YouTube channel support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('1143e34c1b35195aadbd3a9b86cf2cb0a5bda89749716b83a94e485c1e031f86da5f36bb40cba3989986515b40ca931a94c60f6caff239dd29ffb83615bcb240')

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
