# Maintainer: Astroncia <kestraly+gmail+com>

pkgname=astronciaiptv
pkgver=0.0.73
pkgrel=1
pkgdesc="IPTV player with EPG support"
arch=('any')
url="https://gitlab.com/astroncia/iptv"
license=('GPL3')
depends=('python' 'qt6-base' 'mpv' 'pyside6' 'python-pillow' 'python-pandas' 'python-gobject' 'python-pydbus' 'python-unidecode' 'python-requests' 'ffmpeg')
source=(${url}/-/archive/${pkgver}/iptv-${pkgver}.tar.gz)
b2sums=('90351e317feb0e05fc3ef22a191f9a7c1a120419fc03af2a55d939e7ce2b5b0e1c40fabd4996ab8addf7398cc8e4ca9c0179a1eb7386665d0c86b2cd5c6ea86b')

build() {
        cd iptv-${pkgver}
        make
}

package() {
        cd iptv-${pkgver}
        install -D      -t "${pkgdir}"/usr/bin usr/bin/astronciaiptv
        install -Dm755  -t "${pkgdir}"/usr/lib/astronciaiptv usr/lib/astronciaiptv/astroncia_iptv.py
        install -Dm644  -t "${pkgdir}"/usr/share/applications usr/share/applications/astronciaiptv.desktop
        install -Dm644  -t "${pkgdir}"/usr/share/astronciaiptv/icons usr/share/astronciaiptv/icons/*.{gif,png}
        install -Dm644  -t "${pkgdir}"/usr/share/astronciaiptv/icons_dark usr/share/astronciaiptv/icons_dark/*.{gif,png}
        for i in 16 32 48 128 256; do
          install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps" \
            "usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
        done
        cp -a usr/lib/astronciaiptv/data "${pkgdir}"/usr/lib/astronciaiptv/data
 
        # Translations
        cp -a usr/share/locale "${pkgdir}"/usr/share/locale
}
