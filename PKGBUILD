# Maintainer: yukichan

pkgname=yuki-iptv-git
pkgver=0.0.3
pkgrel=1
pkgdesc="IPTV player with EPG support"
arch=('any')
url="https://github.com/yuki-iptv/yuki-iptv"
license=('GPL3')
depends=('python' 'qt6-base' 'mpv' 'python-pyqt6' 'python-pillow' 'python-gobject' 'python-unidecode' 'python-requests' 'python-chardet' 'python-setproctitle' 'python-pydbus' 'ffmpeg')
optdepends=('yt-dlp: YouTube channel support')
makedepends=('make' 'git')
provides=('yuki-iptv')
conflicts=('yuki-iptv')
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
        cd ${pkgname/-git}
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
        cd ${pkgname/-git}
        sed -i "s/__DEB_VERSION__/${pkgver}/g" usr/lib/yuki-iptv/yuki-iptv.py
        make
}

package() {
        cd ${pkgname/-git}
        cp -r usr/ "$pkgdir/"
}
