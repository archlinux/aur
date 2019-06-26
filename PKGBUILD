# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=mitalk
pkgver=4.0.19
pkgrel=1
pkgdesc="MiTalk Messenger"
arch=('x86_64')
url="http://www.miliao.com/"
license=('custom')
makedepends=(
    'p7zip'
    'sed'
)
source=(
    'https://s1.zb.mi.com/miliao/apk/miliao/7.4/MiTalk_'${pkgver}'.AppImage'
)
md5sums=(
    'b6d92c52d2c0f27e55a07b5f1255669e'
)

package() {
    7z x MiTalk_${pkgver}.AppImage -o"${pkgdir}"/opt/mitalk/

    chmod -R 755 "${pkgdir}"/opt/

    mkdir -p "${pkgdir}"/usr/
    mv "${pkgdir}"/opt/mitalk/usr/share/ "${pkgdir}"/usr/

    sed -i "s/Exec=AppRun/Exec=\/opt\/mitalk\/AppRun/g" "${pkgdir}"/opt/mitalk/mitalk.desktop
    install -Dm644 "${pkgdir}"/opt/mitalk/mitalk.desktop "${pkgdir}"/usr/share/applications/mitalk.desktop

    rm "${pkgdir}"/opt/mitalk/mitalk.png
    rm "${pkgdir}"/opt/mitalk/mitalk.desktop
}
