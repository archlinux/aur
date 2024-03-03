# Maintainer: Senge Dev <sengedev at gmail dot com>
# Contributor: Senge Dev <sengedev at gmail dot com>

pkgname=1panel-dev-bin
pkgver=1.10.0_alpha.9
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
sha256sums_x86_64=("e11edf7f433a33a9ebbb51f718caa1b6c96df3f4927633f7404296d8c8fc2e32"
"949f4427f8f3d21232245c7511182d6bd3fa2f76eff366026ebcfc758549a940")
sha256sums_aarch64=("a5537b60ec51e99a8f33e761e5c63494b9e356471eabc528d74de65e5986f101"
"949f4427f8f3d21232245c7511182d6bd3fa2f76eff366026ebcfc758549a940")

package() {
    install -vd ${pkgdir}/opt/1panel
    install -vDm755 ${srcdir}/*/1panel ${pkgdir}/usr/bin/1panel
    install -vDm755 ${srcdir}/*/1panel.service -t ${pkgdir}/usr/lib/systemd/system
    install -vDm755 1pctl ${pkgdir}/usr/bin/1pctl
    sed -i -e "s#ORIGINAL_VERSION=.*#ORIGINAL_VERSION=v${pkgver//_/-}#g" ${pkgdir}/usr/bin/1pctl
}
