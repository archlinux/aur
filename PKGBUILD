# Maintainer: Astroncia <kestraly+gmail+com>

pkgname=astronciaiptv
pkgver=0.0.80
pkgrel=1
pkgdesc="IPTV player with EPG support"
arch=('any')
url="https://gitlab.com/astroncia/iptv"
license=('GPL3')
makedepends=('make')
depends=('python' 'qt6-base' 'mpv' 'pyside6' 'python-pillow' 'python-pandas' 'python-gobject' 'python-pydbus' 'python-unidecode' 'python-requests' 'python-chardet' 'python-setproctitle' 'ffmpeg')
optdepends=('youtube-dl: YouTube channel support')
source=(${url}/-/archive/${pkgver}/iptv-${pkgver}.tar.gz)
b2sums=('d626ca0bb88f1797207f39f7cdf30f8266744db138c156ecde22e90077a696cff3b6f24aed556e791db156966a4b7d3b2d63c5af22ac14030e5e682803458896')

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
        cp -a usr/lib/astronciaiptv/astroncia "${pkgdir}"/usr/lib/astronciaiptv/astroncia
        cp -a usr/lib/astronciaiptv/thirdparty "${pkgdir}"/usr/lib/astronciaiptv/thirdparty
 
        # Translations
        cp -a usr/share/locale "${pkgdir}"/usr/share/locale
}
