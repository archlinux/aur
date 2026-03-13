# SPDX-License-Identifier: GPL-3.0-or-later
# Maintainer: Kaz Walker <me@kazatron.com>
pkgname=workfort
pkgver=0.0.0
pkgrel=1
pkgdesc='Scope — WorkFort team collaboration CLI'
arch=('x86_64' 'aarch64')
url='https://github.com/Work-Fort/Scope'
license=('GPL-3.0-or-later')
depends=()
makedepends=('go')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "Scope-${pkgver}"
    export CGO_ENABLED=0
    _ver="${pkgver}-aur"
    go build -trimpath -ldflags "-s -w -X github.com/Work-Fort/Scope/cmd.Version=${_ver}" -o workfort .
}

check() {
    cd "Scope-${pkgver}"
    CGO_ENABLED=0 go test ./...
}

package() {
    cd "Scope-${pkgver}"
    install -Dm755 workfort "${pkgdir}/usr/bin/workfort"
}
