# Maintainer: Astroncia <kestraly+gmail+com>

pkgname=astronciaiptv
pkgver=0.0.62
pkgrel=1
pkgdesc="IPTV player with EPG support"
arch=('any')
url="https://gitlab.com/astroncia/iptv"
license=('GPL3')
depends=('python' 'qt6-base' 'mpv' 'pyside6' 'python-pillow' 'python-pandas' 'python-gobject' 'python-pydbus' 'python-unidecode' 'python-requests' 'ffmpeg')
source=(${url}/-/archive/${pkgver}/iptv-${pkgver}.tar.gz)
b2sums=('f3c6d02de27df1dc6e340a0234be4decb660ba2a43b121209305801e864d153c373f4d27fc5f43f7e874760790632ace59219c5b0c6de2aab72eab96e7a82e2c')

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
