# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=creamplayer
_appname=Creamplayer
pkgver=4.0.2
pkgrel=2
pkgdesc="Netease music and QQ music downloader and player.网易云播放/下载器,QQ音乐批量下载工具"
arch=('any')
url="https://github.com/Beadd/Creamplayer"
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=('bash' 'electron13')
makedepends=('npm' 'nodejs-lts-gallium' 'gendesk')
optdepends=('nvm: change nodejs version to 16')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('af1239c6a20d1f656bf79fd5df51fc81488437a3747b7988d40eb5a5aa129136'
            'eb8b4ad7fbcc07dc45dfc7b37d99dcf7ad0041c097776546afbe9a062b189008')
build() {
    cd "${srcdir}/${_appname}-${pkgver}"
#    nvm use 16
    npm install --force
    npm add webpack
    npm run electron:build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644  "${srcdir}/${_appname}-${pkgver}/dist_electron/linux-unpacked/resources/app.asar" -t resources"${pkgdir}/opt/${pkgname}/resources"
    gendesk -f -n --categories "AudioVideo" --name "${_appname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644  "${srcdir}/${_appname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}