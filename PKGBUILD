# Maintainer: taotieren <admin@taotieren.com>

pkgname=nationstech-jlink-pack
pkgver=1.0.6
pkgrel=2
epoch=
pkgdesc="JLINK Pack 支持包支持 Nationstech (国民技术) 全系列芯片，在 SEGGER JLink 7.62 及以上版本下的安装。"
arch=('any')
url="https://bbs.21ic.com/icview-3183882-1-1.html"
license=('custom' 'Commercial')
groups=()
depends=("jlink-software-and-documentation>=7.62")
makedepends=('unzip-natspec')
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
            'da23417b4f6901d25d7b0f858c31743475be9a7ade92ee4d97a6f879c2c4f31a')
#validpgpkeys=()

prepare() {
    unzip  -O gbk -o "${srcdir}/${pkgname}-${pkgver}.zip"
}

package() {
    install -dm0755 "${pkgdir}/opt/nationstech/n32/"
    cd ${srcdir}/jlink工具添加Nationstech芯片V${pkgver}/jlink工具添加Nationstech芯片V${pkgver}
    cp -rv Samples "${pkgdir}/opt/nationstech/n32/"
    cp -rv Devices "${pkgdir}/opt/nationstech/n32/"
    cp -rv Nationstech-JLinkDevices.xml "${pkgdir}/opt/nationstech/n32/"

    find "${pkgdir}/opt/nationstech/n32/" -type f -exec chmod 644 "{}" \;
    find "${pkgdir}/opt/nationstech/n32/" -type d -exec chmod 755 "{}" \;

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/bash

if [ ! -d "$HOME"/.config/SEGGER/JLinkDevices ] ; then
    mkdir -p $HOME/.config/SEGGER/JLinkDevices || exit 1
fi

if [ -d "$HOME"/.config/SEGGER/JLinkDevices/n32 ] ; then
    rm -rf $HOME/.config/SEGGER/JLinkDevices/n32 || exit 1
fi

if [ ! -d "$HOME"/.config/SEGGER/JLinkDevices/n32 ] ; then
    cp -r /opt/nationstech/n32 $HOME/.config/SEGGER/JLinkDevices/ || exit 1
fi

EOF
}
