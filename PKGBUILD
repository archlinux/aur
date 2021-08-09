# Maintainer: Astroncia <kestraly+gmail+com>

pkgname=astronciaiptv
pkgver=0.0.60
pkgrel=1
pkgdesc="IPTV player with EPG support"
arch=('any')
url="https://gitlab.com/astroncia/iptv"
license=('GPL3')
depends=('python' 'qt5-base' 'qt5-multimedia' 'qt5-x11extras' 'mpv' 'python-pyqt5' 'python-pillow' 'python-pandas' 'python-gobject' 'python-pydbus' 'python-unidecode' 'python-requests' 'ffmpeg')
source=(${url}/-/archive/${pkgver}/iptv-${pkgver}.tar.gz)
b2sums=('1e3f6b74349d04f3835bfb9407f79be8d2088ba8e69e155fd85041c05cfe235d2aa77214713fe7e92541b4bc11a20d7e2eff467d7db60c07ec0100d859509cce')

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
