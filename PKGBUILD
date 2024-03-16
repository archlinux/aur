# Maintainer: Senge Dev <sengedev@gmail.com>
# Contributor: Senge Dev <sengedev@gmail.com>

pkgname=1panel
pkgver=1.10.1_lts
pkgrel=2
pkgdesc="1Panel, a modern open source linux panel."
arch=('x86_64' 'aarch64')
url="https://1panel.cn"
license=('GPL-3.0-or-later')
install=1panel.install
makedepends=('go' 'nodejs')
optdepends=('ufw' 'firewalld' 'docker' 'docker-compose')
conflicts=('1panel-dev-bin' '1panel-bin' '1panel-git')
source=(
    "${pkgname}-${pkgver//_/-}.tar.gz"::"https://github.com/1Panel-dev/1Panel/archive/refs/tags/v1.10.1-lts.tar.gz"
    "1pinit"
    "1pctl"
    "1panel.service"
)
sha256sums=(
    "3a7b73f4b2a2de10272ab324f542619e8c3a2cc91174ee5e35714fe9a24131a0"
    "SKIP"
    "SKIP"
    "SKIP"
)

prepare() {
    sed -i -e "s#ORIGINAL_VERSION=.*#ORIGINAL_VERSION=v${pkgver//_/-}#g" ${srcdir}/1pctl
}

build() {
    cd ${srcdir}/1Panel-${pkgver//_/-}
    make build_all
}

package() {
    install -vDm755 ${srcdir}/1pinit ${pkgdir}/usr/bin/1pinit
    install -vDm755 ${srcdir}/1Panel-${pkgver//_/-}/build/1panel ${pkgdir}/usr/bin/1panel
    install -vDm644 ${srcdir}/1panel.service -t ${pkgdir}/usr/lib/systemd/system
    install -vDm755 ${srcdir}/1pctl ${pkgdir}/usr/bin/1pctl
}
