# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
pkgname=kawaii-player
_pkgname=kawaii_player
pkgver=3.3.1
pkgrel=1
pkgdesc="A powerful Audio/Video manager, multimedia player and portable media server"
arch=(any)
url="https://github.com/kanishka-linux/kawaii-player"
license=('GPL3')
depends=('curl' 'ffmpegthumbnailer' 'libnotify' 'libtorrent-rasterbar' 'mpv' 'python' 'python-beautifulsoup4' 'python-dbus' 'python-lxml'
         'python-mutagen' 'python-pillow' 'python-pycurl' 'python-pyqt5' 'python-pytaglib' 'qt5-webengine' 'sqlite' 'wget' 'youtube-dl')
makedepends=('git')
conflicts=('kawaii-player-git')
install=kawaii-player.install
source=("https://github.com/kanishka-linux/${pkgname}/releases/download/v${pkgver}-${pkgrel}/${pkgname}-${pkgver}-${pkgrel}.tar.bz2")
md5sums=('8cb5d2ecc909f93f222887f2a9607ed1')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}-${pkgrel}
    python setup.py build
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}-${pkgrel}

    python setup.py install --root="${pkgdir}" --optimize=1

    install -dm755 "${pkgdir}/usr/share/applications/"
    install -dm755 "${pkgdir}/usr/share/pixmaps/"

    cat "${srcdir}/${pkgname}-${pkgver}-${pkgrel}/${_pkgname}/resources/${pkgname}.desktop" | sed "s/Kawaii-Player/Kawaii Player/g" | sed "s/kawaii-player\/resources\/tray/pixmaps\/${pkgname}/g" | sed "s/Exec=/Exec=${pkgname}/g" > "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    cp "${srcdir}/${pkgname}-${pkgver}-${pkgrel}/${_pkgname}/resources/tray.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
