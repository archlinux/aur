# Maintainer: taotieren <admin@taotieren.com>

pkgname=mm32-jlink-pack
pkgver=0.97
pkgrel=1
epoch=
pkgdesc="JLINK Pack 支持包支持 MM32 全系列芯片，在 SEGGER JLink 6.10 及以上版本下的安装。"
arch=('any')
url="https://www.mindmotion.com.cn/support/software/jlink_pack/"
license=('custom' 'Commercial')
groups=()
depends=("jlink-software-and-documentation>=6.10")
makedepends=('libarchive')
checkdepends=()
optdepends=()
provides=('MM32_JLINK_pack')
conflicts=()
replaces=()
backup=()
options=('!strip')
install=${pkgname}.install
changelog=
source=("${pkgname}-${pkgver}.zip::https://www.mindmotion.com.cn/download1.aspx?itemid=152&typeid=4"
        "${pkgname}.install")
noextract=(${pkgname}-${pkgver}.zip)
sha256sums=('b819fe79db4e135e039ebe407318d9b1a4362bbe71720c9f42f52e4f3825770a'
            '783f83bea0655ec837a2c52286ccea7bc5989b183303c62dc92d86a8a6d78fa9')
#validpgpkeys=()

package() {
    install -dm0755 "${pkgdir}/opt/SEGGER/JLink/"
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.zip" --strip-components=1 -C "${pkgdir}/opt/SEGGER/JLink/"

    find "${pkgdir}/opt/SEGGER/JLink/" -type f -exec chmod 644 "{}" \;
    find "${pkgdir}/opt/SEGGER/JLink/" -type d -exec chmod 755 "{}" \;

    cd "${pkgdir}/opt/SEGGER/JLink/"
#     mv JLinkDevices.xml JLinkDevicesMM32.xml
    tail -n +1610 JLinkDevices.xml > JLinkDevicesMM32.xml.patch
    rm -rf JLinkDevices.xml
}
