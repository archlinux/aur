# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
pkgname=kawaii-player
_pkgname=kawaii_player
pkgver=3.8.0
pkgrel=2
_pkgrel=1
pkgdesc="A powerful Audio/Video manager, multimedia player and portable media server"
arch=(any)
url="https://github.com/kanishka-linux/kawaii-player"
license=('GPL3')
depends=('curl' 'ffmpegthumbnailer' 'libnotify' 'libtorrent-rasterbar' 'mpv' 'python' 'python-beautifulsoup4' 'python-certifi' 'python-dbus'
         'python-lxml' 'python-mutagen' 'python-pillow' 'python-pycurl' 'python-pyqt5' 'qt5-webengine' 'sqlite')
optdepends=('ffmpeg: extract and convert subtitles'
            'mplayer: alternative backend'
            'xorg-server-xvfb: run in headless mode'
            'youtube-dl: YouTube support')
makedepends=('git')
conflicts=('kawaii-player-git')
install=kawaii-player.install
source=("https://github.com/kanishka-linux/${pkgname}/releases/download/v${pkgver}-${_pkgrel}/${pkgname}-${pkgver}-${_pkgrel}.tar.bz2")
sha256sums=('ec22745a93a19d373d01dc5b46d9575c833a454d41085005bd4b467e70ac52bb')

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
