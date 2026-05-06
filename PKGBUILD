# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fooyin-bin
_pkgname=Fooyin
_appname="org.${pkgname%-bin}.${pkgname%-bin}"
pkgver=0.10.5
pkgrel=1
pkgdesc="A customisable music player.Binary version."
arch=('x86_64')
url="https://www.fooyin.org/"
_ghurl="https://github.com/ludouzi/fooyin"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'qt6-base'
    'qt6-svg'
    'alsa-lib'
    'taglib'
    'ffmpeg'
    'kdsingleapplication'
    'libgme'
    'libarchive'
    'libvgm-git'
    'taglib1'
    'libgme'
    'libarchive'
    'qcoro'
    'soundtouch'
    'libgme'
    'libarchive'
)
optdepends=(
    'sdl2: For the SDL2 audio output plugin'
    'libpipewire: For the PipeWire audio output plugin'
    'libsndfile: For the GME audio input plugin'
    'libebur128: For the ReplayGain scanner plugin'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.fc44.x86_64.rpm"
)
sha256sums=('d0ea6b62da204bdbc9b2cc4f2459f9d934273fdec64dc91e139beb64e5ddf59b')
prepare() {
    #bsdtar -xf "${srcdir}/data."*
    sed -i "s/${_appname}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/lib64/${pkgname%-bin}/"*.so* -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib64/${pkgname%-bin}/plugins/"*.so -t "${pkgdir}/usr/lib/${pkgname%-bin}/plugins"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    #ln -sf "/usr/lib/libkdsingleapplication-qt6.so" "${pkgdir}/usr/lib/${pkgname%-bin}/libkdsingleapplication-qt6.so.1.1"
    #ln -sf "/usr/lib/libavcodec.so.62" "${pkgdir}/usr/lib/${pkgname%-bin}/libavcodec.so.61"
    #ln -sf "/usr/lib/libavformat.so.62" "${pkgdir}/usr/lib/${pkgname%-bin}/libavformat.so.61"
    #ln -sf "/usr/lib/libavfilter.so.11" "${pkgdir}/usr/lib/${pkgname%-bin}/libavfilter.so.10"
    #ln -sf "/usr/lib/libavutil.so.60" "${pkgdir}/usr/lib/${pkgname%-bin}/libavutil.so.59"
    #ln -sf "/usr/lib/libswresample.so.6" "${pkgdir}/usr/lib/${pkgname%-bin}/libswresample.so.5"
    #ln -sf "/usr/lib/libicuuc.so.78" "${pkgdir}/usr/lib/${pkgname%-bin}/libicuuc.so.77"
    #ln -sf "/usr/lib/libicui18n.so.78" "${pkgdir}/usr/lib/${pkgname%-bin}/libicui18n.so.77"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/${_appname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/usr/share/${pkgname%-bin}/translations/"*.qm -t "${pkgdir}/usr/share/${pkgname%-bin}/translations"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/metainfo/${_appname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml"
}
