# Maintainer: Senge Dev <sengedev at gmail dot com>
# Contributor: Senge Dev <sengedev at gmail dot com>

pkgname=1panel-bin
pkgver=1.10.0_lts
pkgrel=1
pkgdesc="1Panel 是一个现代化、开源的 Linux 服务器运维管理面板。"
arch=('x86_64' 'aarch64')
url="https://1panel.cn"
license=('GPL-3.0-or-later')
install=1panel-bin.install
depends=(
    'docker'
    'docker-compose'
)
optdepends=(
    'ufw'
    'firewalld'
)
conflicts=('1panel-dev-bin')
source_aarch64=("${pkgname}-${pkgver//_/-}-arm64.tar.gz::https://resource.fit2cloud.com/1panel/package/stable/v${pkgver//_/-}/release/1panel-v${pkgver//_/-}-linux-arm64.tar.gz"
"1pctl::https://gitee.com/sengedev/${pkgname}/raw/main/1pctl")

source_x86_64=("${pkgname}-${pkgver//_/-}-amd64.tar.gz::https://resource.fit2cloud.com/1panel/package/stable/v${pkgver//_/-}/release/1panel-v${pkgver//_/-}-linux-amd64.tar.gz"
"1pctl::https://gitee.com/sengedev/${pkgname}/raw/main/1pctl")
sha256sums_x86_64=("c3735145fbdc8103ef8b3c1b726cedf8ed05d06aa84b075f3b0d4c0291b76100"
"949f4427f8f3d21232245c7511182d6bd3fa2f76eff366026ebcfc758549a940")
sha256sums_aarch64=("4b223ffdd7e50c2e93bae91fe7dd4aba24153bb2a1f7199883e8e6862e88005e"
"949f4427f8f3d21232245c7511182d6bd3fa2f76eff366026ebcfc758549a940")

package() {
    install -vd ${pkgdir}/opt/1panel
    install -vDm755 ${srcdir}/*/1panel ${pkgdir}/usr/bin/1panel
    install -vDm755 ${srcdir}/*/1panel.service -t ${pkgdir}/usr/lib/systemd/system
    install -vDm755 1pctl ${pkgdir}/usr/bin/1pctl
    sed -i -e "s#ORIGINAL_VERSION=.*#ORIGINAL_VERSION=v${pkgver//_/-}#g" ${pkgdir}/usr/bin/1pctl
}
