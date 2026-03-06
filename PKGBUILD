# Maintainer: Kaz Walker <me@kazatron.com>
pkgname=sharkfin
pkgver=0.0.2
pkgrel=1
pkgdesc='Messaging over MCP for agent/human development teams'
arch=('x86_64' 'aarch64')
url='https://github.com/Work-Fort/Sharkfin'
license=('GPL-2.0-only')
makedepends=('go')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7c6b6c495af59dbf219d9e610586d71cdac9b472e5c1d924fa8d1164da42aeff')

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
