# Maintainer: Hamza Gbada <hamza.gbada@gmail.com>

pkgname=docker-model
pkgver=1.1.37
pkgrel=1
pkgdesc="Docker CLI plugin for running AI models (model-cli; upstream repo version 1.1.17, CLI version differs)"
arch=('x86_64')
url="https://github.com/docker/model-runner"
license=('Apache-2.0')
depends=('docker')
makedepends=('git' 'go')
provides=('docker-model')
conflicts=('docker-model-bin')

source=("git+https://github.com/docker/model-runner.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd model-runner/cmd/cli

    export CGO_ENABLED=0
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    go build -o docker-model .
}

package() {
    cd model-runner

    install -Dm755 "cmd/cli/docker-model" \
        "$pkgdir/usr/lib/docker/cli-plugins/docker-model"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
