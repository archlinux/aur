# Maintainer: Senge Dev <sengedev at gmail dot com>
# Contributor: Senge Dev <sengedev at gmail dot com>

pkgname=1panel-dev-bin
pkgver=1.10.1_alpha.2
pkgrel=1
pkgdesc="1Panel 是一个现代化、开源的 Linux 服务器运维管理面板。（本包为开发板，不建议在生产环境安装）"
arch=('x86_64' 'aarch64')
url="https://1panel.cn"
license=('GPL-3.0-or-later')
install=1panel-dev-bin.install
depends=(
    'docker'
    'docker-compose'
)
optdepends=(
    'ufw'
    'firewalld'
)
conflicts=('1panel-bin')
source_aarch64=("${pkgname}-${pkgver//_/-}-arm64.tar.gz::https://resource.fit2cloud.com/1panel/package/dev/v${pkgver//_/-}/release/1panel-v${pkgver//_/-}-linux-arm64.tar.gz"
"1pctl::https://gitee.com/sengedev/1panel-bin/raw/main/1pctl")

source_x86_64=("${pkgname}-${pkgver//_/-}-amd64.tar.gz::https://resource.fit2cloud.com/1panel/package/dev/v${pkgver//_/-}/release/1panel-v${pkgver//_/-}-linux-amd64.tar.gz"
"1pctl::https://gitee.com/sengedev/1panel-bin/raw/main/1pctl")
sha256sums_x86_64=("ce04714a0868ffe112feae42c98704727ccfbcb33d046a5414ec9b0e7832d4e7"
"949f4427f8f3d21232245c7511182d6bd3fa2f76eff366026ebcfc758549a940")
sha256sums_aarch64=("a226362dacfe8974b9f39d13665bdd047058a91704b09721d4ad438eadf9f6b9"
"949f4427f8f3d21232245c7511182d6bd3fa2f76eff366026ebcfc758549a940")

package() {
    install -vd ${pkgdir}/opt/1panel
    install -vDm755 ${srcdir}/*/1panel ${pkgdir}/usr/bin/1panel
    install -vDm755 ${srcdir}/*/1panel.service -t ${pkgdir}/usr/lib/systemd/system
    install -vDm755 1pctl ${pkgdir}/usr/bin/1pctl
    sed -i -e "s#ORIGINAL_VERSION=.*#ORIGINAL_VERSION=v${pkgver//_/-}#g" ${pkgdir}/usr/bin/1pctl
}
