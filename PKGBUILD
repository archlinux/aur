pkgname=erigon
pkgdesc='Ethereum implementation on the efficiency frontier.'
pkgver=2.28.1
pkgrel=1
epoch=1
url='https://github.com/ledgerwatch/erigon'
arch=('x86_64')
license=('GPL3')
makedepends=('go')
depends=('glibc')
source=("https://github.com/ledgerwatch/erigon/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2a50f70b5f347dc40f0d259ff0448acd08501265390741b1ee9e817c8a0fab87')

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
