# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=mitalk
pkgver=4.0.21
pkgrel=1
pkgdesc="MiTalk Messenger"
arch=('x86_64')
url="http://www.miliao.com/"
license=('custom')
makedepends=(
    'p7zip'
    'sed'
)
depends=(
    'xorg-xrandr'
)
source=(
    'https://s1.zb.mi.com/miliao/apk/miliao/7.4/MiTalk_'${pkgver}'.AppImage'
)
md5sums=(
    '20f61c47978d7ac0bb8f833244c96be6'
)

package() {
    7z x MiTalk_"${pkgver}".AppImage -o"${pkgdir}"/opt/mitalk/

    chmod -R 755 "${pkgdir}"/opt/

    mkdir -p "${pkgdir}"/usr/
    mv "${pkgdir}"/opt/mitalk/usr/share/ "${pkgdir}"/usr/

    sed -i "s/Exec=AppRun/Exec=\/opt\/mitalk\/AppRun/g" "${pkgdir}"/opt/mitalk/mitalk.desktop
    install -Dm644 "${pkgdir}"/opt/mitalk/mitalk.desktop "${pkgdir}"/usr/share/applications/mitalk.desktop

    rm "${pkgdir}"/opt/mitalk/mitalk.png
    rm "${pkgdir}"/opt/mitalk/mitalk.desktop
}
