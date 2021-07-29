# Maintainer: taotieren <admin@taotieren.com>

pkgname=csky-qemu-bin
pkgver=3.2.0
pkgrel=1
epoch=
pkgdesc="C-Sky Qemu"
arch=('x86_64')
url="https://occ.t-head.cn/community/download?id=636946310057951232"
license=('GPL2' 'LGPL2.1' 'custom')
groups=()
depends=('bash')
makedepends=("tar")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=(
        "${pkgname}-${pkgver}.tar.gz::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1356021/1612269502091/${pkgname%-bin}-${arch}-Ubuntu-16.04-20210202-1445.tar.gz"
        "C-SKY QEMU User Guide.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1355977/1593743011800/C-SKY_QEMU_User_Guide.pdf"
        "C-SKY CPF User Guide.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/cop-image-prod/resource/420257228264570880/1577083422668/C-SKY+CPF+User+Guide.pdf")
noextract=(${pkgname}-${pkgver}.tar.gz)
sha256sums=('a13735079ab89d84a43794810b8941bffee8a95bef89a6aa05ccb2c4fa46b2f7'
            '1eb8b7f77dc85b066154d87899d4ee9d792f0c64aa6a51e0a063e8ea41eb3b82'
            '26e2a6d7980339ea538f3dba3950e92d03a33ab8b70b68223f809ad1f285b4d3')
#validpgpkeys=()

package() {
    install -dm0755 "${pkgdir}/opt/t-head/${pkgname%-bin}"

    tar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" --no-same-owner --no-same-permissions -C "${pkgdir}/opt/t-head/${pkgname%-bin}"
    cp -r "${srcdir}"/*.pdf "${pkgdir}/opt/t-head/${pkgname%-bin}"
    install -Dm0755 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname%-bin}.sh" << EOF
#!/bin/sh
[ -d /opt/t-head/${pkgname%-bin}/bin ] && append_path '/opt/t-head/${pkgname%-bin}/bin'

export PATH
EOF

}
