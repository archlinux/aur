# Maintainer: Astroncia <kestraly+gmail+com>

pkgname=astronciaiptv
pkgver=0.0.58
pkgrel=1
pkgdesc="IPTV player"
arch=('any')
url="https://gitlab.com/astroncia/iptv"
license=('GPL3')
depends=('python' 'qt5-base' 'qt5-multimedia' 'qt5-x11extras' 'mpv' 'python-pyqt5' 'python-pillow' 'python-pandas' 'python-gobject' 'python-pydbus' 'python-unidecode' 'python-requests' 'ffmpeg')
source=(${url}/-/archive/${pkgver}/iptv-${pkgver}.tar.gz)
b2sums=('ed05ac4fc763bad377e6b2bfb49e648e97560e33126e6348c95a97fb1c006d6945ac0902618343593ce1c5a8b0c7f5938564383e0f633c786f6be94584dcfd9c')

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
        chmod 755 "${pkgdir}"/usr/bin/astronciaiptv
        chmod 755 "${pkgdir}"/usr/lib/astronciaiptv/data/modules/astroncia/pfs.py
}
