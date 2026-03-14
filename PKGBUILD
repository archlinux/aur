# SPDX-License-Identifier: Apache-2.0
# Maintainer: Kaz Walker <me@kazatron.com>
pkgname=workfort
pkgver=0.1.0
pkgrel=1
pkgdesc='WorkFort web and TUI frontend'
arch=('x86_64' 'aarch64')
url='https://github.com/Work-Fort/Scope'
license=('Apache-2.0')
depends=()
makedepends=('go')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b767b7bc1af5910eafe089ebbc0517f992595136c1a0714eaad71cf49cea2593')

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
