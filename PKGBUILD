# Maintainer: Spider.007 <aur@spider007.net>
# Maintainer: chengxuncc <chengxuncc@gmail.com>

pkgname=prysm
pkgver=5.0.1
pkgrel=2
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
sha256sums_x86_64=('2bb8c7a26021dbc0e067e841d996fd4f6d21f633d1a9fe64bb2a73c35f222e35'
                   'bf40c882e0aca96b5593d0d41f719e7195c732044ec7df52d5525b47603571db'
                   'aefe713b263d5a34b91a9dba265a9f783abadb868a727b954082b16388e1472c')
sha256sums_aarch64=('e970f997c4caf645b310ad839f0f00748f23fb5a522de340bad80a47271b6710'
                    '9a651b39ef58903bc03544132dc90f1aa39c73423d769233e3cc003d91489c63'
                    '7cf65fab1b7c04f8528200643192c2ba6abfd39f11837d51bebb12b8a40e4aff')

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
