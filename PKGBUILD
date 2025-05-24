# Maintainer: Spider.007 <aur@spider007.net>
# Maintainer: chengxuncc <chengxuncc@gmail.com>

pkgname=prysm
pkgver=6.0.3
pkgrel=1
pkgdesc="Prysm is an Ethereum proof-of-stake client written in Go."
arch=('x86_64' 'aarch64')
url="https://prysmaticlabs.com/"
license=(GPLv3)

source=(prysm-beacon-chain.service
        prysm-client-stats.service
        prysm-validator.service)

source_x86_64=("prysm-beacon-chain-$pkgver-$arch::https://prysmaticlabs.com/releases/beacon-chain-v${pkgver}-linux-amd64"
               "prysm-validator-$pkgver-$arch::https://prysmaticlabs.com/releases/validator-v${pkgver}-linux-amd64"
               "prysm-client-stats-$pkgver-$arch::https://prysmaticlabs.com/releases/client-stats-v${pkgver}-linux-amd64")

source_aarch64=("prysm-beacon-chain-$pkgver-$arch::https://prysmaticlabs.com/releases/beacon-chain-v${pkgver}-linux-arm64"
                "prysm-validator-$pkgver-$arch::https://prysmaticlabs.com/releases/validator-v${pkgver}-linux-arm64"
                "prysm-client-stats-$pkgver-$arch::https://prysmaticlabs.com/releases/client-stats-v${pkgver}-linux-arm64")


sha256sums=('fc52438b1319fb1e61c85c6d96abce83009c3898e517051f140093944b45f2e3'
            'cc19fe37cd80972e3a214f5de577b315996e428c8e93cb362c5beb8204d8a173'
            '143147f19424a17147d342d1ac4006d8a154dbbb9e4b5a2f8e594d43e90bd305')
sha256sums_x86_64=('db67cb1f150267e3b7c711b564c51efbb98bdb91328c76853e0accf213cd0baa'
                   '682631922af510c10416b54e3a0dc8d64233f11ae45e4d3736141a77a1ebdb85'
                   '17202804b47c232a071e0eeaffc4a96e0c9d51f8e88272bc26d25c839a3fef69')
sha256sums_aarch64=('db67cb1f150267e3b7c711b564c51efbb98bdb91328c76853e0accf213cd0baa'
                    '682631922af510c10416b54e3a0dc8d64233f11ae45e4d3736141a77a1ebdb85'
                    '17202804b47c232a071e0eeaffc4a96e0c9d51f8e88272bc26d25c839a3fef69')

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/bin/"
    
    install "prysm-beacon-chain-$pkgver-$arch" "$pkgdir/usr/bin/prysm-beacon-chain"
    install "prysm-validator-$pkgver-$arch" "$pkgdir/usr/bin/prysm-validator"
    install "prysm-client-stats-$pkgver-$arch" "$pkgdir/usr/bin/prysm-client-stats"
    
    install -Dm644 "prysm-beacon-chain.service" -t "$pkgdir/usr/lib/systemd/user"
    install -Dm644 "prysm-validator.service" -t "$pkgdir/usr/lib/systemd/user"
    install -Dm644 "prysm-client-stats.service" -t "$pkgdir/usr/lib/systemd/user"
}
