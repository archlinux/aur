# Maintainer: Astroncia <kestraly+gmail+com>

pkgname=astronciaiptv
pkgver=0.0.89
pkgrel=1
pkgdesc="IPTV player with EPG support"
arch=('any')
url="https://gitlab.com/astroncia/iptv"
license=('GPL3')
makedepends=('make')
depends=('python' 'qt6-base' 'mpv' 'python-pyqt6' 'python-pillow' 'python-pandas' 'python-gobject' 'python-pydbus' 'python-unidecode' 'python-requests' 'python-chardet' 'python-setproctitle' 'ffmpeg')
optdepends=('yt-dlp: YouTube channel support')
source=(${url}/-/archive/${pkgver}/iptv-${pkgver}.tar.gz)
b2sums=('06e9c21d008fe7e124f41ca2079f3902f5946bd25258b291ab661d019a11ef4c4cde1ad7fa736195cd24097b2d5b2ba59e5b72cda3c39f83501c1ae6810b1cf1')

prepare() {
        cd iptv-${pkgver}
        sed -i "s/__DEB_VERSION__/${pkgver}/g" usr/lib/astronciaiptv/astroncia_iptv.py
}

build() {
        cd iptv-${pkgver}
        make
}

package() {
        cd iptv-${pkgver}
        install -D      -t "${pkgdir}"/usr/bin usr/bin/astronciaiptv
        install -Dm644  -t "${pkgdir}"/usr/lib/astronciaiptv usr/lib/astronciaiptv/astroncia_iptv.py
        install -Dm644  -t "${pkgdir}"/usr/share/applications usr/share/applications/astronciaiptv.desktop
        install -Dm644  -t "${pkgdir}"/usr/share/astronciaiptv/icons usr/share/astronciaiptv/icons/*.{gif,png}
        install -Dm644  -t "${pkgdir}"/usr/share/astronciaiptv/icons_dark usr/share/astronciaiptv/icons_dark/*.{gif,png}
        install -Dm644  -t "${pkgdir}"/usr/share/icons/hicolor/scalable/apps usr/share/icons/hicolor/scalable/apps/astronciaiptv.svg
        install -Dm644  -t "${pkgdir}"/usr/share/metainfo usr/share/metainfo/astronciaiptv.appdata.xml
        cp -a usr/lib/astronciaiptv/astroncia "${pkgdir}"/usr/lib/astronciaiptv/astroncia
        cp -a usr/lib/astronciaiptv/thirdparty "${pkgdir}"/usr/lib/astronciaiptv/thirdparty
 
        # Translations
        cp -a usr/share/locale "${pkgdir}"/usr/share/locale
}
