# Maintainer: Spider.007 <aur@spider007.net>
# Maintainer: chengxuncc <chengxuncc@gmail.com>
# Maintainer: gnidan <aur@gnidan.org>

pkgname=prysm
pkgver=7.0.0
pkgrel=1
pkgdesc="Ethereum proof-of-stake consensus client written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/OffchainLabs/prysm"
license=('GPL-3.0-only')
depends=('glibc')
provides=('ethereum-consensus-client')

source=(prysm-beacon-chain.service
        prysm-client-stats.service
        prysm-validator.service)

source_x86_64=("prysm-beacon-chain-${pkgver}-${arch}::https://github.com/OffchainLabs/prysm/releases/download/v${pkgver}/beacon-chain-v${pkgver}-linux-amd64"
               "prysm-validator-${pkgver}-${arch}::https://github.com/OffchainLabs/prysm/releases/download/v${pkgver}/validator-v${pkgver}-linux-amd64"
               "prysm-client-stats-${pkgver}-${arch}::https://github.com/OffchainLabs/prysm/releases/download/v${pkgver}/client-stats-v${pkgver}-linux-amd64")

source_aarch64=("prysm-beacon-chain-${pkgver}-${arch}::https://github.com/OffchainLabs/prysm/releases/download/v${pkgver}/beacon-chain-v${pkgver}-linux-arm64"
                "prysm-validator-${pkgver}-${arch}::https://github.com/OffchainLabs/prysm/releases/download/v${pkgver}/validator-v${pkgver}-linux-arm64"
                "prysm-client-stats-${pkgver}-${arch}::https://github.com/OffchainLabs/prysm/releases/download/v${pkgver}/client-stats-v${pkgver}-linux-arm64")

sha256sums=('fc52438b1319fb1e61c85c6d96abce83009c3898e517051f140093944b45f2e3'
            'cc19fe37cd80972e3a214f5de577b315996e428c8e93cb362c5beb8204d8a173'
            '143147f19424a17147d342d1ac4006d8a154dbbb9e4b5a2f8e594d43e90bd305')
sha256sums_x86_64=('d95d68726e9d3cfdac412349d94ccb2e05f4c11147976f7362d8ac87b853e26a'
                   'cc582a6ba5b56c85c447259976e9fd3f727be483204519ad2912591e52554e06'
                   'e536356535ade2f417d70311ac82c397a1823e2aaf04e1d5d54bbf95aee38961')
sha256sums_aarch64=('d95d68726e9d3cfdac412349d94ccb2e05f4c11147976f7362d8ac87b853e26a'
                    'cc582a6ba5b56c85c447259976e9fd3f727be483204519ad2912591e52554e06'
                    'e536356535ade2f417d70311ac82c397a1823e2aaf04e1d5d54bbf95aee38961')

package() {
    cd "${srcdir}"

    # Install binaries
    install -Dm755 "prysm-beacon-chain-${pkgver}-${arch}" "${pkgdir}/usr/bin/prysm-beacon-chain"
    install -Dm755 "prysm-validator-${pkgver}-${arch}" "${pkgdir}/usr/bin/prysm-validator"
    install -Dm755 "prysm-client-stats-${pkgver}-${arch}" "${pkgdir}/usr/bin/prysm-client-stats"

    # Install systemd service files
    install -Dm644 "prysm-beacon-chain.service" -t "${pkgdir}/usr/lib/systemd/user"
    install -Dm644 "prysm-validator.service" -t "${pkgdir}/usr/lib/systemd/user"
    install -Dm644 "prysm-client-stats.service" -t "${pkgdir}/usr/lib/systemd/user"
}
