# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Command line tool for the Semaphore CI service'
pkgname=semaphoreci-cli
pkgver=0.21.0
pkgrel=1
url=https://github.com/semaphoreci/cli
license=(Apache)
arch=(x86_64)
depends=()
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('842a9200d91e475d0cb7a1c879c2d1db174c04a388116c810c49000cf7615727')
install=semaphoreci-cli.install

build () {
    cd "${srcdir}/cli-${pkgver}"
    GOPATH="${srcdir}/_go" GOOS=linux GOARCH=${target_arch} \
        go build -ldflags "-s -w -X cmd.version=${pkgver}-arch" \
        -o semaphoreci
    chmod -R +w "${srcdir}/_go"  # Ugh.
}

package () {
    cd "${srcdir}/cli-${pkgver}"
    install -Dm755 -t "${pkgdir}/usr/bin" semaphoreci
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
