# SPDX-License-Identifier: AGPL-3.0-or-later
# Maintainer: Kaz Walker <me@kazatron.com>
pkgname=sharkfin
pkgver=0.5.0
pkgrel=1
pkgdesc='Messaging over MCP for agent/human development teams'
arch=('x86_64' 'aarch64')
url='https://github.com/Work-Fort/Sharkfin'
license=('AGPL-3.0-or-later')
makedepends=('go')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('762262b6be7c157dbfab41ea9a382c7f64116d284b42ea64ecbc9cd9956f8289')

build() {
    cd "Sharkfin-v${pkgver}"
    export CGO_ENABLED=0
    go build -ldflags "-X github.com/Work-Fort/sharkfin/cmd.Version=v${pkgver}" -o sharkfin
}

package() {
    cd "Sharkfin-v${pkgver}"
    install -Dm755 sharkfin "${pkgdir}/usr/bin/sharkfin"
    install -Dm644 dist/sharkfin.system.service "${pkgdir}/usr/lib/systemd/user/sharkfin.service"
}
