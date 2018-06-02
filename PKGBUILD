# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
pkgname=kawaii-player
_pkgname=kawaii_player
pkgver=3.6.0
pkgrel=2
_pkgrel=1
pkgdesc="A powerful Audio/Video manager, multimedia player and portable media server"
arch=(any)
url="https://github.com/kanishka-linux/kawaii-player"
license=('GPL3')
depends=('curl' 'ffmpegthumbnailer' 'libnotify' 'libtorrent-rasterbar' 'mpv' 'python' 'python-beautifulsoup4' 'python-certifi' 'python-dbus'
         'python-lxml' 'python-mutagen' 'python-pillow' 'python-pycurl' 'python-pyqt5' 'qt5-webengine' 'sqlite' 'youtube-dl')
optdepends=('mplayer: alternative backend')
makedepends=('git')
conflicts=('kawaii-player-git')
install=kawaii-player.install
source=("https://github.com/kanishka-linux/${pkgname}/releases/download/v${pkgver}-${_pkgrel}/${pkgname}-${pkgver}-${_pkgrel}.tar.bz2")
md5sums=('a1af476bab93baa37c979f1c3e9c055c')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}-${_pkgrel}
    python setup.py build
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}-${_pkgrel}

    python setup.py install --root="${pkgdir}" --optimize=1

    install -dm755 "${pkgdir}/usr/share/applications/"
    install -dm755 "${pkgdir}/usr/share/pixmaps/"

    cat "${srcdir}/${pkgname}-${pkgver}-${_pkgrel}/${_pkgname}/resources/${pkgname}.desktop" | sed "s/Kawaii-Player/Kawaii Player/g" | sed "s/kawaii-player\/resources\/tray/pixmaps\/${pkgname}/g" | sed "s/Exec=/Exec=${pkgname}/g" > "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    cp "${srcdir}/${pkgname}-${pkgver}-${_pkgrel}/${_pkgname}/resources/tray.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
