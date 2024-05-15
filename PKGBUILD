# Maintainer: Spider.007 <aur@spider007.net>
# Maintainer: chengxuncc <chengxuncc@gmail.com>

pkgname=prysm
pkgver=5.0.3
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
sha256sums_x86_64=('729207bfb7a438ec123a9c2f8b6b7d255382114ff9600f7f33f90121a0b60196'
                   '412325d16c060844655360155738a6f2c9fef0dd0622d44520fc8f41dc483f49'
                   'd3ba3c5030c43779283161a07e7bbaf298821320bce51f66954321dadfbba159')
sha256sums_aarch64=('5b5cd4c34733ebc0f085c102e757a3d06f5737903512e1f74b85ece792b2c6e8'
                    'c70d72e428f3efabff4cbd19626aadbb40ce3aac669fcc74dc65c7817a62557c'
                    '700958caddbbaf292eb19ee3e4130568062b627da565f939bb011f43379362fe')

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
