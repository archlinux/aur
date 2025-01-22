# Maintainer: MYT1 <MYT1 @ QQ .com>
# Maintainer: i4 <admin@i4.cn>
# Maintainer: taotieren <admin@taotieren.com>
pkgname=i4tools-bin
_pkgname=i4tools
pkgver=3.07.001
pkgrel=1
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
    'zlib')
source=(
    "${_pkgname}_v${pkgver}.rpm::https://d-updater.i4.cn/i4linux/deb/${_pkgname}_v${pkgver}.rpm"
    "https://www.i4.cn/copyright.html"
)
sha256sums=('389882b00739ef29a9a8c27e539dd0fec67cfcf9995294c44161a6a38bb48e3d'
            'f3cc70ece76bae973291aa37ced5a48da64360ec4860e8549240a5f6cd3babd4')

package() {
    install -m755 -d "${pkgdir}/opt/cn.i4Tools"
    install -m755 -d "${pkgdir}/usr/share/pixmaps"
    install -m755 -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -m755 -d "${pkgdir}/usr/bin" 
    install -Dm644 ${srcdir}/copyright.html "$pkgdir/usr/share/licenses/$pkgname/copyright.html"
    cd ${srcdir}/opt/apps/cn.i4Tools
    sed '10s/.*/Exec=i4tools %u/g' -i cn.i4Tools.desktop
    sed '11s/.*/Icon=i4tools/g' -i cn.i4Tools.desktop
    install -Dm644 cn.i4Tools.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop
    sed '7s/.*/    cd \/opt\/cn.i4Tools/g' -i run.sh
    sed -i '8i\	export LD_LIBRARY_PATH=\/opt\/cn.i4Tools\/lib:$LD_LIBRARY_PATH' run.sh
    install -Dm755 run.sh "${pkgdir}/usr/bin/${_pkgname}"
    cp -r "${srcdir}/opt/apps/cn.i4Tools" "${pkgdir}/opt/"
    cd "${srcdir}/opt/apps/cn.i4Tools/resources"
    cp logo.png "$pkgdir"/usr/share/pixmaps/$_pkgname.png
    cp logo.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg       
}
