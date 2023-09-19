# Maintainer: Yugami
# Contributor: yukichan

pkgname=yuki-iptv-git
pkgver=0.0.7
pkgrel=1
pkgdesc="IPTV player with EPG support (Astroncia IPTV fork)"
arch=('any')
url="https://github.com/yuki-iptv/yuki-iptv"
license=('GPL3')
depends=('python' 'qt6-base' 'mpv' 'python-pyqt6' 'python-wand' 'python-gobject' 'python-unidecode' 'python-requests' 'python-chardet' 'python-setproctitle' 'python-pydbus' 'ffmpeg')
optdepends=('yt-dlp: YouTube channel support')
makedepends=('make' 'git')
provides=('yuki-iptv')
conflicts=('yuki-iptv')
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
        cd ${pkgname/-git}
        printf "0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
