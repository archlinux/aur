# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
pkgname=kawaii-player
_pkgname=kawaii_player
pkgver=4.0.0
pkgrel=1
_pkgrel=1
pkgdesc="Multimedia player, media library manager and portable media server with PC-to-PC casting feature"
arch=(any)
url="https://github.com/kanishka-linux/kawaii-player"
license=('GPL3')
depends=('libnotify' 'mpv' 'sqlite'
         'python-beautifulsoup4' 'python-certifi' 'python-dbus' 'python-lxml' 'python-mutagen' 'python-opengl'
         'python-pillow' 'python-pycurl' 'python-pyqtwebengine')
optdepends=('python-pympv: modern opengl-render API for libmpv'
            'libtorrent-rasterbar: torrent streaming'
            'youtube-dl: YouTube streaming'
            'xorg-server-xvfb: run in headless mode')
makedepends=('git')
conflicts=('kawaii-player-git')
install=$pkgname.install
source=("https://github.com/kanishka-linux/${pkgname}/releases/download/v${pkgver}-${_pkgrel}/${pkgname}-${pkgver}-${_pkgrel}.tar.bz2")
sha256sums=('9cd2e6bc66b3e56e546e5dbb0f23f6ca644d540b463cb9a72a67a1cf4814f12a')

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
