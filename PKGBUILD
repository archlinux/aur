# Maintainer: MYT1 <MYT1 @ QQ .com>
# Maintainer: i4 <admin@i4.cn>
# Maintainer: taotieren <admin@taotieren.com>
pkgname=i4tools-bin
_pkgname=i4tools
pkgver=3.08.001
pkgrel=3
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
    "${_pkgname}_v${pkgver}.rpm::https://d-updater.i4.cn/i4linux/deb/${_pkgname}_v${pkgver}.rpm"
    "https://www.i4.cn/copyright.html"
)
sha256sums=('65c871f5ebc13539ecc5ec4a2532458a7fe8077f770d20dc496e4a22b5412a41'
            '9c94e78ce7f822c06f7c2f866ee8c72e64853b9478cf8c20008cca0e7ba9eec1')

package() {
    install -m755 -d "${pkgdir}/opt/cn.i4Tools"
    install -m755 -d "${pkgdir}/usr/share/pixmaps"
    install -m755 -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -m755 -d "${pkgdir}/usr/bin" 
    install -Dm755 "${srcdir}/opt/apps/cn.i4Tools/"run.sh "${pkgdir}/usr/bin/"${_pkgname}
    install -Dm644 "${srcdir}/opt/apps/cn.i4Tools/"cn.i4Tools.desktop "$pkgdir/usr/share/applications/"$_pkgname.desktop
    install -Dm644 ${srcdir}/copyright.html "$pkgdir/usr/share/licenses/$pkgname/copyright.html"
    sed -i 's|/opt/apps/cn.i4Tools/run.sh|i4tools %u|g' \
        "$pkgdir/usr/share/applications/"$_pkgname.desktop
    sed -i 's|/opt/apps/cn.i4Tools/resources/logo.png|i4tools|g' \
        "$pkgdir/usr/share/applications/"$_pkgname.desktop
    sed -i 's|utils|Utility;|g' \
        "$pkgdir/usr/share/applications/"$_pkgname.desktop
    sed '7s/.*/    cd \/opt\/cn.i4Tools/g' -i "${pkgdir}/usr/bin/"${_pkgname}
    sed -i '8i\	export LD_LIBRARY_PATH=\/opt\/cn.i4Tools\/lib:$LD_LIBRARY_PATH' "${pkgdir}/usr/bin/"${_pkgname}
    cp -r "${srcdir}/opt/apps/cn.i4Tools" "${pkgdir}/opt/"
    cd "${srcdir}/opt/apps/cn.i4Tools/resources"
    cp logo.png "$pkgdir"/usr/share/pixmaps/$_pkgname.png
    cp logo.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg
}
