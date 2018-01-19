# Maintainer: Nocifer <apmihalopoulos at gmail dot com>
pkgname=kawaii-player
_pkgname=kawaii_player
pkgver=2.9.0
pkgrel=1
_pkgrel=0
pkgdesc="A powerful frontend for MPV with media server and torrent streaming capabilities"
arch=(any)
url="https://github.com/kanishka-linux/kawaii-player"
license=('GPL3')
depends=('curl' 'ffmpegthumbnailer' 'libnotify' 'libtorrent-rasterbar' 'mpv' 'python' 'python-beautifulsoup4' 'python-dbus' 'python-lxml'
         'python-mutagen' 'python-pillow' 'python-pycurl' 'python-pyqt5' 'python-pytaglib' 'qt5-webengine' 'sqlite3' 'wget' 'youtube-dl')
makedepends=('git')
source=("https://github.com/kanishka-linux/${pkgname}/releases/download/v${pkgver}-${_pkgrel}/${pkgname}-${pkgver}-${_pkgrel}.tar.bz2")
md5sums=('b469c0deb51ecf1322f2a7eb8c5cd3bd')

package() {
    _app_dir="${srcdir}/${pkgname}-${pkgver}-${_pkgrel}/${_pkgname}"

    install -dm755 "${pkgdir}/opt/"
    install -dm755 "${pkgdir}/usr/bin/"
    install -dm755 "${pkgdir}/usr/share/applications/"
    install -dm755 "${pkgdir}/usr/share/pixmaps/"
  
    cp -r "${_app_dir}" "${pkgdir}/opt/${pkgname}"
    
    ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    chmod +x "${pkgdir}/opt/${pkgname}/${pkgname}"
  
    cat "${_app_dir}/resources/${pkgname}.desktop" | sed "s/Kawaii-Player/Kawaii Player/g" | sed "s/kawaii-player\/resources\/tray/pixmaps\/${pkgname}/g" | sed "s/Exec=/Exec=python -B \/opt\/${pkgname}\/${_pkgname}.py \%f/g" > "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    
    cp "${_app_dir}/resources/tray.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
