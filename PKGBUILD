# Maintainer: yukichan

pkgname=yuki-iptv
pkgver=0.0.2
pkgrel=1
pkgdesc="IPTV player with EPG support"
arch=('any')
url="https://github.com/yuki-iptv/yuki-iptv"
license=('GPL3')
makedepends=('make')
depends=('python' 'qt6-base' 'mpv' 'python-pyqt6' 'python-pillow' 'python-gobject' 'python-unidecode' 'python-requests' 'python-chardet' 'python-setproctitle' 'ffmpeg')
optdepends=('yt-dlp: YouTube channel support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('851e730f804a4bfc1bd5eafe32368a1410256c56d0c70af35044b7bf9c099fe87cf02516a449cdc23eb15f060febe7d067364559e585b6e042c0a8c816ac70de')

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
