# Maintainer: Jove Yu <yushijun110 at 126 dot com>
pkgname=freechat-uos
url="https://github.com/eNkru/freechat"
pkgver=1.0.0
pkgrel=1
pkgdesc="致力于打造macOS和Linux桌面下最好用的微信客户端。(添加UOS补丁)"
arch=("x86_64")
license=("MIT")
makedepends=("yarn")
provides=("freechat")
source=(
    "https://github.com/eNkru/freechat/archive/v$pkgver.zip"
    "https://github.com/JoveYu/PKGBUILD/releases/download/0.0.1/wechat-uos-token.tar.gz"
    "uos.patch"
    "freechat.desktop"
)
md5sums=('0213ce4ef07b329b811af3498d851967'
         '52226b5b73054d2d53fed7e97568aa6f'
         '5e4390b5227c9ecb2706fdcb927a943f'
         '64faa178571d2f8871b3e021024dc009')

build() {
    cd "${srcdir}"/freechat-$pkgver
    patch -p1 < "${srcdir}"/uos.patch
    yarn install --registry https://registry.npm.taobao.org/
    yarn electron-builder --linux --x64 --dir
}

package() {
    install -Dm644 "${srcdir}"/freechat.desktop "${pkgdir}"/usr/share/applications/freechat.desktop
    install -Dm644 "${srcdir}"/freechat-$pkgver/build/icons/12x12.png "${pkgdir}"/usr/share/icons/hicolor/12x12/apps/freechat.png
    install -Dm644 "${srcdir}"/freechat-$pkgver/build/icons/16x16.png "${pkgdir}"/usr/share/icons/hicolor/16x16/apps/freechat.png
    install -Dm644 "${srcdir}"/freechat-$pkgver/build/icons/32x32.png "${pkgdir}"/usr/share/icons/hicolor/32x32/apps/freechat.png
    install -Dm644 "${srcdir}"/freechat-$pkgver/build/icons/48x48.png "${pkgdir}"/usr/share/icons/hicolor/48x48/apps/freechat.png
    install -Dm644 "${srcdir}"/freechat-$pkgver/build/icons/64x64.png "${pkgdir}"/usr/share/icons/hicolor/64x64/apps/freechat.png
    install -Dm644 "${srcdir}"/freechat-$pkgver/build/icons/128x128.png "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/freechat.png
    install -Dm644 "${srcdir}"/freechat-$pkgver/build/icons/256x256.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/freechat.png
    install -Dm644 "${srcdir}"/freechat-$pkgver/build/icons/512x512.png "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/freechat.png

    install -dm755 "${pkgdir}"/opt/freechat
    cp -R "${srcdir}"/freechat-$pkgver/dist/linux-unpacked/* "${pkgdir}"/opt/freechat

    cp -R "${srcdir}"/wechat-uos-token "${pkgdir}"/opt/
}
