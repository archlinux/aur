# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Core_UK <mail.coreuk@gmail.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
pkgname=apple-music-electron-bin
_pkgname=Apple-Music-Electron
pkgver=3.1.1
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
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-electron-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/Alex313031/Apple-Music-Electron/master/LICENSE.md"
    "${pkgname%-bin}.sh")
sha256sums=('7bf6157f871af6f3dee522ffbdb846c88689c2c87a542bdbe12898e1dfd280b8'
            '0fd63c3d94a7db5724728de22068188d45aa0c6be04c6e4c4c5983b5d46d5eee'
            '44dc6173c7bb88874ac68a31aaacc0bfb422a8fcd218d54cc124ebf36a5c5e72')
package(){
	bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/Apple Music/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|\"/opt/Apple Music/${pkgname%-bin}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    cp -r "${srcdir}/usr/share/icons" "${pkgdir}/usr/share"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}