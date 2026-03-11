# SPDX-License-Identifier: AGPL-3.0-or-later
# Maintainer: Kaz Walker <me@kazatron.com>
pkgname=sharkfin
pkgver=0.5.2
pkgrel=1
pkgdesc='Messaging over MCP for agent/human development teams'
arch=('x86_64' 'aarch64')
url='https://github.com/Work-Fort/Sharkfin'
license=('AGPL-3.0-or-later')
makedepends=('go')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f982439c248c770a3e70874ca5177f9f5973ae24e928367b0eb4e19f99018912')

build() {
    cd "Sharkfin-${pkgver}"
    export CGO_ENABLED=0
    go build -trimpath \
        -ldflags "-s -w -X github.com/Work-Fort/sharkfin/cmd.Version=v${pkgver}" \
        -o sharkfin
}

package() {
    cd "Sharkfin-${pkgver}"
    install -Dm755 sharkfin "${pkgdir}/usr/bin/sharkfin"
    install -Dm644 dist/sharkfin.system.service "${pkgdir}/usr/lib/systemd/user/sharkfin.service"
}
