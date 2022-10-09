pkgname=erigon
pkgver=2.27.0
pkgrel=1
epoch=1
pkgdesc='Ethereum implementation on the efficiency frontier.'
arch=('x86_64')
url='https://github.com/ledgerwatch/erigon'
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("https://github.com/ledgerwatch/erigon/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d7ea06bf2add7585fdc8e79805e104046a9da901a2bdf02e214a4209e40ac241')

build() {
    cd ${pkgname}-${pkgver}

    export CGO_LDFLAGS="${LDFLAGS}"
    export GIT_TAG="v${pkgver}"
    make all
}

package() {
    cd ${pkgname}-${pkgver}

    install -Dm755 build/bin/erigon "${pkgdir}"/usr/bin/erigon
    install -Dm755 build/bin/rpcdaemon "${pkgdir}"/usr/bin/erigon-rpcdaemon
    install -Dm755 build/bin/sentry "${pkgdir}"/usr/bin/erigon-sentry
    install -Dm755 build/bin/downloader "${pkgdir}"/usr/bin/erigon-downloader
    install -Dm755 build/bin/txpool "${pkgdir}"/usr/bin/erigon-txpool
    install -Dm755 build/bin/integration "${pkgdir}"/usr/bin/erigon-integration
    install -Dm755 build/bin/hack "${pkgdir}"/usr/bin/erigon-hack
}
