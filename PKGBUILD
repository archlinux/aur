# Maintainer: Spider.007 <aur@spider007.net>
# Maintainer: chengxuncc <chengxuncc@gmail.com>

pkgname=prysm
pkgver=5.1.0
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
sha256sums_x86_64=('bc59aabe40d32959692dba260003fc5004775ac0f7fa2513a66fc28dc2f4717f'
                   'dd27f4a050caea3d40eb961bf1bab3393c9ce4827f38cc841653912c9a6d13cd'
                   'fc7b37f26ec84463b03481c5cfb8c962c8d97fdfd3ea5949d78b75c3e67304fa')
sha256sums_aarch64=('bc59aabe40d32959692dba260003fc5004775ac0f7fa2513a66fc28dc2f4717f'
                    'dd27f4a050caea3d40eb961bf1bab3393c9ce4827f38cc841653912c9a6d13cd'
                    'fc7b37f26ec84463b03481c5cfb8c962c8d97fdfd3ea5949d78b75c3e67304fa')

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
