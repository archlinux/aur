# Maintainer: Astroncia <kestraly+gmail+com>

pkgname=astronciaiptv
pkgver=0.0.66
pkgrel=1
pkgdesc="IPTV player with EPG support"
arch=('any')
url="https://gitlab.com/astroncia/iptv"
license=('GPL3')
depends=('python' 'qt6-base' 'mpv' 'pyside6' 'python-pillow' 'python-pandas' 'python-gobject' 'python-pydbus' 'python-unidecode' 'python-requests' 'ffmpeg')
source=(${url}/-/archive/${pkgver}/iptv-${pkgver}.tar.gz)
b2sums=('6f2977360276293663727c91eee231476b6ad2cd923521c36f199d33a64ecb2b0907720dfd2eeb1381c5897fbdc424fc9cfa968d375c39254eacfdffa51cc6a0')

build() {
        cd iptv-${pkgver}
        make
}

package() {
        cd iptv-${pkgver}
        install -D      -t "${pkgdir}"/usr/bin packaging/usr/bin/astronciaiptv
        install -Dm755  -t "${pkgdir}"/usr/lib/astronciaiptv astroncia_iptv.py
        install -Dm644  -t "${pkgdir}"/usr/share/applications packaging/usr/share/applications/astronciaiptv.desktop
	mkdir -p "${pkgdir}"/usr/share/icons/
	mkdir -p "${pkgdir}"/usr/lib/astronciaiptv/
        cp -r packaging/usr/share/icons/hicolor "${pkgdir}"/usr/share/icons/
        cp -r data "${pkgdir}"/usr/lib/astronciaiptv/
        rm -rf "${pkgdir}"/usr/lib/astronciaiptv/data/modules/binary "${pkgdir}"/usr/lib/astronciaiptv/data/lang/astronciaiptv.pot
        rm -rf "${pkgdir}"/usr/lib/astronciaiptv/data/lang/update_translations.sh "${pkgdir}"/usr/lib/astronciaiptv/data/lang/*/*/*.po
        chmod 755 "${pkgdir}"/usr/bin/astronciaiptv
        chmod 755 "${pkgdir}"/usr/lib/astronciaiptv/data/modules/astroncia/pfs.py
}
