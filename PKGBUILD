# Maintainer: Arne Beer <privat@arne.beer>

pkgname=webhook-server-git
pkgdesc='A web server for executing stuff on your server on requests'
pkgver='b003049'
pkgrel=1
arch=('x86_64')
license=('MIT')
depends=('rust')
conflicts=('webhook-server')
makedepends=('git')
provides=('webhook-server')
url='https://github.com/nukesor/webhook-server'
source=("git+https://github.com/nukesor/webhook-server.git")
sha256sums=('SKIP')

build() {
    cd webhook-server

    # Build
    cargo build --release --locked
}

package() {
    cd webhook-server

    # Place bin in /usr/bin
    install -Dm755 "target/release/webhookserver" "${pkgdir}/usr/bin/webhookserver"

    # Install License
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
