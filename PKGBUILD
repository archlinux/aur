# Maintainer: douglarek

pkgname=yuki-iptv-fork
pkgver=0.0.7
pkgrel=1
pkgdesc="IPTV player with EPG support (Astroncia IPTV fork)"
arch=('any')
url="https://github.com/yuki-iptv/yuki-iptv"
license=('GPL3')
makedepends=('make')
depends=('python' 'qt6-base' 'mpv' 'python-pyqt6' 'python-wand' 'python-gobject' 'python-unidecode' 'python-requests' 'python-chardet' 'python-setproctitle' 'python-pydbus' 'ffmpeg')
optdepends=('yt-dlp: YouTube channel support')
provides=('yuki-iptv')
conflicts=('yuki-iptv')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('f55ee559ab71cf9cbd20778aa1cc8fa6ec220a0e720816190316a7993c28280da4ad1227c2ca215183f7234e8fc9ed0786e1c013262eef5ea90c086800b38fbb')

prepare() {
        cd "${pkgname::-5}-${pkgver}"

        # Set version in About dialog
        sed -i "s/__DEB_VERSION__/${pkgver//+*/}/g" usr/lib/yuki-iptv/yuki-iptv.py
}

build() {
        cd "${pkgname::-5}-${pkgver}"
        make
}

package() {
        cd "${pkgname::-5}-${pkgver}"
        cp -r usr/ "$pkgdir/"
}
