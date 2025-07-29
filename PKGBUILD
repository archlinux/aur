# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Raphael Nestler <raphael.nestler@gmail.com>
pkgdesc='Command line tool for the Semaphore CI service'
pkgname=semaphoreci-cli
pkgver=0.32.0
pkgrel=1
url=https://github.com/semaphoreci/cli
license=(Apache)
arch=(x86_64)
depends=()
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ba99cf3378a82b44e22ffd3b264d509cee3fd85fdc7eda03bd128c3fffb467bc')
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
