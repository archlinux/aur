# Maintainer: Senge Dev <sengedev at gmail dot com>
# Contributor: Senge Dev <sengedev at gmail dot com>

pkgname=1panel-bin
pkgver=1.9.6
pkgrel=1
pkgdesc="1Panel 是一个现代化、开源的 Linux 服务器运维管理面板。"
arch=('x86_64')
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
source=("${pkgname}-${pkgver}.tar.gz::https://resource.fit2cloud.com/1panel/package/stable/v${pkgver}/release/1panel-v${pkgver}-linux-amd64.tar.gz"
"1pctl::https://raw.githubusercontent.com/sengedev/${pkgname}/main/1pctl")
sha256sums=("5c33d3b882d4eebf1f3dbf1e91c791ec962dc382cb08120c25b03946b6085798"
"SKIP")

package() {
    install -vd ${pkgdir}/opt/1panel
    install -vDm755 ${srcdir}/*/1panel ${pkgdir}/usr/bin/1panel
    install -vDm755 ${srcdir}/*/1panel.service -t ${pkgdir}/usr/lib/systemd/system
    install -vDm755 1pctl ${pkgdir}/usr/bin/1pctl
    sed -i -e "s#ORIGINAL_VERSION=.*#ORIGINAL_VERSION=v${pkgver}#g" ${pkgdir}/usr/bin/1pctl
}
