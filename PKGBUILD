# Maintainer: Nanami <Yejia995@gmail.com>
# Contributor: bilibili_xiaok <the_xiaok@qq.com>
# Contributor: little_sheepycn <little_sheepycn@redstonebuild.onmicrosoft.com>
# Icon based on https://github.com/Peternal
pkgname=bilibili-electron
_pkgname=${pkgname%-bin}
pkgver=rolling
pkgrel=4
pkgdesc="A Linux bilibili GUI. Use installed electron."
arch=("x86_64" "aarch64")
license=("MIT")
url="https://github.com/msojocs/bilibili-linux"
provides=(${_pkgname})
conflicts=("bilibili-bin")
depends=("electron" "ffmpeg")
makedepends=("asar")
source_x86_64=("${pkgname}-${pkgver}-x86_64-linux.tar.gz::${url}/releases/download/continuous/bilibili-continuous-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64-linux.tar.gz::${url}/releases/download/continuous/bilibili-continuous-arm64.tar.gz")
source=(
    "${pkgname}.desktop"
    "${pkgname}.svg"
    "${pkgname}")
sha256sums=("B6F201540670FA18BF448BE3EA78CB338621AE2B3CCD3BFC6573712A20BAC936"
            "C0030C516E783E8B9930E8D2E3B04B8F9C56A2C9E85B1367380C1812A0A03655"
            "0F4E10C86A6AB59E4A0395960BF396201190AF22CA488F8FB85E4FD941EE9665")
sha256sums_x86_64=("SKIP")
sha256sums_aarch64=("SKIP")

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
