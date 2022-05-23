# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Raphael Nestler <raphael.nestler@gmail.com>
pkgdesc='Command line tool for the Semaphore CI service'
pkgname=semaphoreci-cli
pkgver=0.25.0
pkgrel=1
url=https://github.com/semaphoreci/cli
license=(Apache)
arch=(x86_64)
depends=()
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c9d888b1df4c9e9ef6f2f128e61156e8df126892876adc7221d18f555f656702')
install=semaphoreci-cli.install

build () {
    cd "${srcdir}/cli-${pkgver}"
    GOPATH="${srcdir}/_go" GOOS=linux GOARCH=${target_arch} \
        go build -ldflags "-s -w -X main.version=${pkgver}-arch -X 'main.date=$(date --iso)'" \
        -o semaphoreci
    chmod -R +w "${srcdir}/_go"  # Ugh.
}

package () {
    cd "${srcdir}/cli-${pkgver}"
    install -Dm755 -t "${pkgdir}/usr/bin" semaphoreci
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
