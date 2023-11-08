# Maintainer: Spider.007 <aur@spider007.net>
# Maintainer: chengxuncc <chengxuncc@gmail.com>

pkgname=prysm
pkgver=4.1.1
pkgrel=1
pkgdesc="Prysm is an Ethereum proof-of-stake client written in Go."
arch=('x86_64' 'aarch64')
url="https://prysmaticlabs.com/"
license=(GPLv3)

source=(prysm-beacon-chain.service
        prysm-client-stats.service
        prysm-validator.service)
sha256sums=('fc52438b1319fb1e61c85c6d96abce83009c3898e517051f140093944b45f2e3'
            'cc19fe37cd80972e3a214f5de577b315996e428c8e93cb362c5beb8204d8a173'
            '143147f19424a17147d342d1ac4006d8a154dbbb9e4b5a2f8e594d43e90bd305')

source_x86_64=("prysm-beacon-chain_x86_64::https://prysmaticlabs.com/releases/beacon-chain-v${pkgver}-linux-amd64"
               "prysm-validator_x86_64::https://prysmaticlabs.com/releases/validator-v${pkgver}-linux-amd64"
               "prysm-client-stats_x86_64::https://prysmaticlabs.com/releases/client-stats-v${pkgver}-linux-amd64")
sha256sums_x86_64=('108feeca273432fcb0e968d1fc3dab38a412650c591440733cad73e3140d02b5'
                   '84a21cf16ff877ef7bc5ecc9d6cf12cdb6a4ad856846ade24bd052e68e81cd1a'
                   'd65a833b2507499144af11b31fd93a2349a7ff739421894704e931c5f11c5d56')

source_aarch64=("prysm-beacon-chain_aarch64::https://prysmaticlabs.com/releases/beacon-chain-v${pkgver}-linux-arm64"
                "prysm-validator_aarch64::https://prysmaticlabs.com/releases/validator-v${pkgver}-linux-arm64"
                "prysm-client-stats_aarch64::https://prysmaticlabs.com/releases/client-stats-v${pkgver}-linux-arm64")
sha256sums_aarch64=('68db674c5ab36957b08e335c0d417ce2279ea1dca690ce302f73b156a7dbafbb'
                    '9bb255c486a197b1981f980ef8c30d69792732b432b398cdf641b575f14ce98c'
                    'd31190632025ac8d74b9017ea6e491b27b6547b1f505f4c034cf78d39b6d14ba')


package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/bin/"
    
    install "prysm-beacon-chain_$arch" "$pkgdir/usr/bin/prysm-beacon-chain"
    install "prysm-validator_$arch" "$pkgdir/usr/bin/prysm-validator"
    install "prysm-client-stats_$arch" "$pkgdir/usr/bin/prysm-client-stats"
    
    install -Dm644 "prysm-beacon-chain.service" -t "$pkgdir/usr/lib/systemd/user"
    install -Dm644 "prysm-validator.service" -t "$pkgdir/usr/lib/systemd/user"
    install -Dm644 "prysm-client-stats.service" -t "$pkgdir/usr/lib/systemd/user"
}