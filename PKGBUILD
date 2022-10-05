# Maintainer: Artem Vorotnikov <artem@vorotnikov.me>

pkgname=erigon
pkgver=2022.10.01
pkgrel=1
pkgdesc='Ethereum implementation on the efficiency frontier.'
arch=('x86_64')
url='https://github.com/ledgerwatch/erigon'
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("https://github.com/ledgerwatch/erigon/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a38029170a3a82a27f85957207b8d0c2d660de58920a850f836514c504b26fb2')

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
