# Maintainer: Artem Vorotnikov <artem@vorotnikov.me>

pkgname=erigon
pkgver=2022.09.01
pkgrel=1
pkgdesc='Ethereum implementation on the efficiency frontier.'
arch=('x86_64')
url='https://github.com/ledgerwatch/erigon'
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("https://github.com/ledgerwatch/erigon/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1f91daef4797a9a2928259227d1c31d2a5274f4eaf0d37b220fcf060277b8f78')

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
