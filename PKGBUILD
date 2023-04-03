# Maintainer: yukichan

pkgname=yuki-iptv-git
pkgver=0.0.1
pkgrel=1
pkgdesc="IPTV player with EPG support"
arch=('any')
url="https://github.com/yuki-iptv/yuki-iptv"
license=('GPL3')
depends=('python' 'qt6-base' 'mpv' 'python-pyqt6' 'python-pillow' 'python-gobject' 'python-unidecode' 'python-requests' 'python-chardet' 'python-setproctitle' 'ffmpeg')
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
        install -D      -t "${pkgdir}"/usr/bin usr/bin/yuki-iptv
        install -Dm644  -t "${pkgdir}"/usr/lib/yuki-iptv usr/lib/yuki-iptv/yuki-iptv.py
        install -Dm644  -t "${pkgdir}"/usr/share/applications usr/share/applications/yuki-iptv.desktop
        install -Dm644  -t "${pkgdir}"/usr/share/yuki-iptv/icons usr/share/yuki-iptv/icons/*.{gif,png}
        install -Dm644  -t "${pkgdir}"/usr/share/yuki-iptv/icons_dark usr/share/yuki-iptv/icons_dark/*.{gif,png}
        install -Dm644  -t "${pkgdir}"/usr/share/icons/hicolor/scalable/apps usr/share/icons/hicolor/scalable/apps/yuki-iptv.svg
        install -Dm644  -t "${pkgdir}"/usr/share/metainfo usr/share/metainfo/yuki-iptv.appdata.xml
        install -Dm644  -t "${pkgdir}"/usr/share/yuki-iptv usr/share/yuki-iptv/license.txt
        cp -a usr/lib/yuki-iptv/yuki_iptv "${pkgdir}"/usr/lib/yuki-iptv/yuki_iptv
        cp -a usr/lib/yuki-iptv/thirdparty "${pkgdir}"/usr/lib/yuki-iptv/thirdparty
 
        # Translations
        cp -a usr/share/locale "${pkgdir}"/usr/share/locale
}
