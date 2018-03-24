# Maintainer: Nocifer <apmihalopoulos at gmail dot com>
pkgname=kawaii-player
_pkgname=kawaii_player
pkgver=3.3.0
pkgrel=1
_pkgrel=0
pkgdesc="A powerful Audio/Video manager, multimedia player and portable media server"
arch=(any)
url="https://github.com/kanishka-linux/kawaii-player"
license=('GPL3')
depends=('curl' 'ffmpegthumbnailer' 'libnotify' 'libtorrent-rasterbar' 'mpv' 'python' 'python-beautifulsoup4' 'python-dbus' 'python-lxml'
         'python-mutagen' 'python-pillow' 'python-pycurl' 'python-pyqt5' 'python-pytaglib' 'qt5-webengine' 'sqlite' 'wget' 'youtube-dl')
makedepends=('git')
source=("https://github.com/kanishka-linux/${pkgname}/releases/download/v${pkgver}-${_pkgrel}/${pkgname}-${pkgver}-${_pkgrel}.tar.bz2")
install=kawaii-player.install
md5sums=('6b50528d589250ac6ea6e0cd311f3a66')

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
