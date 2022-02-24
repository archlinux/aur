# Maintainer: taotieren <admin@taotieren.com>

pkgname=nationstech-jlink-pack
pkgver=1.0.6
pkgrel=1
epoch=
pkgdesc="JLINK Pack 支持包支持 Nationstech (国民技术) 全系列芯片，在 SEGGER JLink 6.42 及以上版本下的安装。"
arch=('any')
url="https://bbs.21ic.com/icview-3183882-1-1.html"
license=('custom' 'Commercial')
groups=()
depends=("jlink-software-and-documentation>=6.42")
makedepends=('unzip')
checkdepends=()
optdepends=()
provides=('Nationstech_JLINK_pack')
conflicts=()
replaces=()
backup=()
options=('!strip')
install=${pkgname}.install
changelog=
source=("${pkgname}-${pkgver}.zip::https://bbs.21ic.com/forum.php?mod=attachment&aid=MTc5OTg4Mnw5YTUzMDhjZHwxNjQ1Njk2NDU4fDE3MTY4ODR8MzE4Mzg4Mg%3D%3D"
        "${pkgname}.install")
noextract=(${pkgname}-${pkgver}.zip)
sha256sums=('2fd82a41d8a77adebf777353b5bdcca37e4803685badf9a3ce12ad3c67e5a83d'
            'fd9bcba2df02c185cefac582b404d86f2b2c4a8f4d7d8ff0a890f596af11c9ec')
#validpgpkeys=()

package() {

    install -dm0755 "${pkgdir}/opt/SEGGER/JLink/"

    unzip -O gbk -o "${srcdir}/${pkgname}-${pkgver}.zip"
    cp -rv ${srcdir}/jlink*/jlink*/. "${pkgdir}/opt/SEGGER/JLink/"

    find "${pkgdir}/opt/SEGGER/JLink/" -type f -exec chmod 644 "{}" \;
    find "${pkgdir}/opt/SEGGER/JLink/" -type d -exec chmod 755 "{}" \;

    cd "${pkgdir}/opt/SEGGER/JLink/"

    sed -i "1d" Nationstech-JLinkDevices.xml
    rm -rf readme.txt
}
