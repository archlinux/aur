# Maintainer: Spider.007 <aur@spider007.net>
# Maintainer: chengxuncc <chengxuncc@gmail.com>

pkgname=prysm
pkgver=5.0.1
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
sha256sums_x86_64=('705cb088e1fac2e34db79389f08f0566ac9282cb1a9d25f3ca7ebebe594f1e39'
                   '77197554a8eb66c2bdcff038879733dbf6bea1580d87ca0760141850557c71b8'
                   'fe34175dec68f739ccc16446bbda9c1e7ff9f03136849e047264f867064daadf')
sha256sums_aarch64=('4d7c859acab86b85ac5afef8a4c8816bbfd4dad3898a63434a3883457fee27ed'
                    '37cc01e67b2310e0da17f7b0a0755c73cb4a5bbe4a4dc646a9bd9eb1e8103819'
                    'd9b6ee24896f82b755fbc68dc0982589bb6324eabd9205ccd639f64c3c4387e1')

source_x86_64=("prysm-beacon-chain_x86_64::https://prysmaticlabs.com/releases/beacon-chain-v${pkgver}-linux-amd64"
               "prysm-validator_x86_64::https://prysmaticlabs.com/releases/validator-v${pkgver}-linux-amd64"
               "prysm-client-stats_x86_64::https://prysmaticlabs.com/releases/client-stats-v${pkgver}-linux-amd64")

source_aarch64=("prysm-beacon-chain_aarch64::https://prysmaticlabs.com/releases/beacon-chain-v${pkgver}-linux-arm64"
                "prysm-validator_aarch64::https://prysmaticlabs.com/releases/validator-v${pkgver}-linux-arm64"
                "prysm-client-stats_aarch64::https://prysmaticlabs.com/releases/client-stats-v${pkgver}-linux-arm64")


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
