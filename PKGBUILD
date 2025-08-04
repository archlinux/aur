# Maintainer: MYT1 <MYT1 @ QQ .com>
# Maintainer: i4 <admin@i4.cn>
# Maintainer: taotieren <admin@taotieren.com>
pkgname=i4tools-bin
pkgver=3.08.002
pkgrel=1
epoch=1
pkgdesc='爱思助手是一款集“高效管理 iOS 设备数据”，“智能刷机”和“免费下载海量应用游戏、铃声壁纸”等为一体的 iOS 设备管理工具。'
arch=('x86_64')
url="https://www.i4.cn/pro_pc.html"
license=('custom')
depends=(
    'bash'
    'brotli'
    'curl'
    'expat'
    'gcc-libs'
    'glib2'
    'glibc'
    'hicolor-icon-theme'
    'libffi'
    'libp11-kit'
    'openssl'
    'sqlite'
    'util-linux-libs'
    'zlib'
    'usbmuxd'
    'libusbmuxd'
    'libimobiledevice'
    'libimobiledevice-glue')
source=(
    "${pkgname%-bin}_v${pkgver}.rpm::https://d-updater.i4.cn/i4linux/deb/${pkgname%-bin}_v${pkgver}.rpm"
    "https://www.i4.cn/copyright.html"
)
sha256sums=('3e5846ea51c59825f7f2b099dad7bf78d92000ed9800bc0184134b68e4cb991b'
            '9c94e78ce7f822c06f7c2f866ee8c72e64853b9478cf8c20008cca0e7ba9eec1')

package() {
    install -m755 -d "${pkgdir}/opt/${pkgname%-bin}"
    install -m755 -d "${pkgdir}/usr/share/pixmaps"
    install -m755 -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -m755 -d "${pkgdir}/usr/bin" 
    install -Dm755 "${srcdir}/opt/apps/cn.i4Tools/"run.sh "${pkgdir}/usr/bin/"${pkgname%-bin}
    install -Dm644 "${srcdir}/opt/apps/cn.i4Tools/"cn.i4Tools.desktop $pkgdir/usr/share/applications/${pkgname%-bin}.desktop
    install -Dm644 ${srcdir}/copyright.html "$pkgdir/usr/share/licenses/${pkgname%-bin}/copyright.html"
    sed -i 's|/opt/apps/cn.i4Tools/run.sh|i4tools %u|g' \
        "$pkgdir/usr/share/applications/"${pkgname%-bin}.desktop
    sed -i 's|/opt/apps/cn.i4Tools/resources/logo.png|i4tools|g' \
        "$pkgdir/usr/share/applications/"${pkgname%-bin}.desktop
    sed -i 's|utils|Utility;|g' \
        "$pkgdir/usr/share/applications/"${pkgname%-bin}.desktop
    sed '7s/.*/    cd \/opt\/i4tools/g' -i "${pkgdir}/usr/bin/"${pkgname%-bin}
    sed -i '8i\	export LD_LIBRARY_PATH=\/opt\/i4tools\/lib:$LD_LIBRARY_PATH' "${pkgdir}/usr/bin/"${pkgname%-bin}
    cp -r "${srcdir}/opt/apps/cn.i4Tools/"* "${pkgdir}/opt/${pkgname%-bin}/"
    cd "${srcdir}/opt/apps/cn.i4Tools/resources"
    cp logo.png "$pkgdir"/usr/share/pixmaps/${pkgname%-bin}.png
    cp logo.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg
}
