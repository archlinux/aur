# Maintainer: arimxyer
pkgname=modelsdev-git
pkgver=0.0.0
pkgrel=1
pkgdesc='Browse AI models, benchmarks, and coding agents from the terminal'
arch=('x86_64' 'aarch64')
url='https://github.com/arimxyer/models'
license=('MIT')
provides=('modelsdev' 'models')
conflicts=('modelsdev' 'modelsdev-bin')
makedepends=('cargo' 'git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd models
    git describe --tags --long | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd models
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
}

package() {
    cd models
    install -Dm755 "target/release/models" "${pkgdir}/usr/bin/models"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
