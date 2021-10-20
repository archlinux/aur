# Maintainer: Astroncia <kestraly+gmail+com>

pkgname=astronciaiptv
pkgver=0.0.86
pkgrel=1
pkgdesc="IPTV player with EPG support"
arch=('any')
url="https://gitlab.com/astroncia/iptv"
license=('GPL3')
makedepends=('make')
depends=('python' 'qt5-base' 'qt5-x11extras' 'mpv' 'python-pyqt5' 'python-pillow' 'python-pandas' 'python-gobject' 'python-pydbus' 'python-unidecode' 'python-requests' 'python-chardet' 'python-setproctitle' 'ffmpeg')
optdepends=('youtube-dl: YouTube channel support')
source=(${url}/-/archive/${pkgver}/iptv-${pkgver}.tar.gz)
b2sums=('122f5eaa29d2f4cd96f14df4ec081c9237c6867ef44e32dc3807c788448bb5ed762601938c0066c84a5e59732776515d1cfbc078f02bb506922c1af33dbf933a')

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
