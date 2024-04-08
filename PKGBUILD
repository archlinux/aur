# Maintainer: Senge Dev <sengedev@gmail.com>
# Contributor: Senge Dev <sengedev@gmail.com>

pkgname=1panel
pkgver=1.10.2_lts
pkgrel=1
pkgdesc="1Panel, a modern open source linux panel."
arch=('x86_64' 'aarch64')
url="https://1panel.cn"
license=('GPL-3.0-or-later')
install=1panel.install
makedepends=('go' 'nodejs' 'npm')
optdepends=('ufw' 'firewalld' 'docker' 'docker-compose')
conflicts=('1panel-dev-bin' '1panel-bin' '1panel-git')
source=(
    "${pkgname}-${pkgver//_/-}.tar.gz"::"https://github.com/1Panel-dev/1Panel/archive/refs/tags/v${pkgver//_/-}.tar.gz"
    "1pctl"
    "1panel.service"
)
sha256sums=(
    "70540dab6a1e141a15ac174ead22ee19cc4114142e5d30f3594f398b5f15ebc9"
    "cdf766ebf09e4db82e0a008037ec24c5c6b8cbb6153ae714496edaec4d25629a"
    "4cd4145b44ae138e1d085b0cc38d393f290089cc29276696ff2d6afd04acab8b"
)

prepare() {
    sed -i -e "s#ORIGINAL_VERSION=.*#ORIGINAL_VERSION=v${pkgver//_/-}#g" ${srcdir}/1pctl
}

build() {
    cd ${srcdir}/1Panel-${pkgver//_/-}
    make build_all
}

package() {
    install -vDm755 ${srcdir}/1Panel-${pkgver//_/-}/build/1panel ${pkgdir}/usr/bin/1panel
    install -vDm644 ${srcdir}/1panel.service -t ${pkgdir}/usr/lib/systemd/system
    install -vDm755 ${srcdir}/1pctl ${pkgdir}/usr/bin/1pctl
}
