# Maintainer: Astroncia <kestraly+gmail+com>

pkgname=astronciaiptv
pkgver=0.0.92
pkgrel=1
pkgdesc="IPTV player with EPG support"
arch=('any')
url="https://gitlab.com/astroncia/iptv"
license=('GPL3')
makedepends=('make')
depends=('python' 'qt6-base' 'mpv' 'python-pyqt6' 'python-pillow' 'python-gobject' 'python-pydbus' 'python-unidecode' 'python-requests' 'python-chardet' 'python-setproctitle' 'ffmpeg')
optdepends=('yt-dlp: YouTube channel support')
source=(${url}/-/archive/${pkgver}/iptv-${pkgver}.tar.gz)
b2sums=('95cbb6a57d79fd10fea5129e88f0e402b27857afe96390b35a39ffb3686d5730a80b28f3f5931f8da90b0f6f0aaeefb36e5e379de635a1cfdc637af866807751')

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
