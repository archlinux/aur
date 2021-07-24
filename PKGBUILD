# Maintainer: Astroncia <kestraly+gmail+com>

pkgname=astronciaiptv
pkgver=0.0.54
pkgrel=2
pkgdesc="IPTV player"
arch=('any')
url="https://gitlab.com/astroncia/iptv"
license=('GPL3')
depends=('python' 'qt5-base' 'qt5-multimedia' 'qt5-x11extras' 'mpv' 'python-pyqt5' 'python-pillow' 'python-pandas' 'python-gobject' 'python-pydbus' 'python-unidecode' 'python-requests' 'ffmpeg')
source=(${url}/-/archive/${pkgver}/iptv-${pkgver}.tar.gz)
b2sums=('fe63867190a80b6c46144cf2a8e3af545bcbd7fb0b55f7c62e691921c0b67ba9b9d7947b4b32e3089ad3f1bae43771997c931f981b2c70bb78f115cd9957b1be')

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
