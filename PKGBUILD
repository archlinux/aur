# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Core_UK <mail.coreuk@gmail.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
pkgname=apple-music-electron-bin
_pkgname=Apple-Music-Electron
pkgver=3.0.2
pkgrel=1
pkgdesc="A free, lightweight, open source alternative to iTunes and other Apple Music applications based on Electron 15"
arch=('x86_64')
url="https://github.com/Alex313031/Apple-Music-Electron"
license=("MIT")
depends=('gcc-libs' 'alsa-lib' 'electron15' 'portaudio' 'hicolor-icon-theme' 'java-runtime' 'lib32-glibc' 'lib32-alsa-lib' 'glibc')
optdepends=('libnotify: Playback notifications'
            'otf-san-francisco: Use of SF Font for certain themes')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/Alex313031/Apple-Music-Electron/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('ebc08ea72c8e488a9f74539f45358c7f156078e7f5ca1e9c6e0d84e0a146d497'
            'cf7724c85c357c306a0a8489d987214070c547343f493532ffd4a847e6b8a186'
            'e0411c5d36829417b6a5931240854b34a6ef004b9034e5b9df82579763c5a30e')

package(){
	bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/Apple Music/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|\"/opt/Apple Music/${pkgname%-bin}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    cp -r "${srcdir}/usr/share/icons" "${pkgdir}/usr/share"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}