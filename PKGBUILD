# Maintainer: Nanami <Yejia995@gmail.com>
# Contributor: bilibili_xiaok <the_xiaok@qq.com>
# Contributor: little_sheepycn <little_sheepycn@redstonebuild.onmicrosoft.com>
# Icon based on https://github.com/Peternal
pkgname=bilibili-electron
_pkgname=${pkgname%-bin}
pkgver=rolling
pkgrel=1
pkgdesc="A Linux bilibili GUI. Use installed electron."
arch=("x86_64" "aarch64")
license=("MIT")
url="https://github.com/msojocs/bilibili-linux"
provides=(${_pkgname})
conflicts=("bilibili-bin")
depends=("electron" "ffmpeg")
optdepends=("electron17: Only if you would like to install Electron 17.")
makedepends=("asar")
source_x86_64=("${pkgname}-${pkgver}-x86_64-linux.tar.gz::${url}/releases/download/continuous/bilibili-continuous-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64-linux.tar.gz::${url}/releases/download/continuous/bilibili-continuous-arm64.tar.gz")
source=(
    "${pkgname}.desktop"
    "${pkgname}.svg"
    "${pkgname}")
sha256sums=("3e534d098c8537bd0717501dac69266d88614e62c76c00a4e982987f0e4b8101"
            "256fb103121107cf757ecd89caecffb792fd448ae139a1f18d017171ac8a3a06"
            "5bd642f412a7b182fe5c371a0382f5e232df30048735a60fec935df159ff8933")
sha256sums_x86_64=("dfbbacaad3b810d1408b7dcea5bddfcd12787b62bdeaf7e93b2294e2a04ce2cd")
sha256sums_aarch64=("N/A")

build() {
    cd $srcdir
}

package() {
    rm -rf bin
    rm -rf electron
    install -Dm644 "${pkgname}.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "${srcdir}/app/app-update.yml" "${pkgdir}/usr/share/${pkgname}/app-update.yml"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/app/app.asar" "${pkgdir}/usr/share/${pkgname}/app.asar"
    cp -pvr "${srcdir}/app/extensions" "${pkgdir}/usr/share/${pkgname}/extensions"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
