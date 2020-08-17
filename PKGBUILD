# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Command line tool for the Semaphore CI service'
pkgname=semaphoreci-cli
pkgver=0.20.1
pkgrel=1
url=https://github.com/semaphoreci/cli
license=(Apache)
arch=(x86_64)
depends=()
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('60c08d9db8c50261c0e69c346750bc6346b54b171d8aa57971330bc9b4de8510')
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
