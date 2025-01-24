# Maintainer: Spider.007 <aur@spider007.net>
# Maintainer: chengxuncc <chengxuncc@gmail.com>

pkgname=prysm
pkgver=5.2.0
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
sha256sums_x86_64=('bd8c8756943a75f4b6d120b5a9b215a56d071a4fc986ff91af2a4b01e1ac6aea'
                   'e96e7109071c81dceb421cd00b3ba29af6bd0507a87f19af098a334729e54d58'
                   'e8fc8e8530e7f7c2b038fe0ffc97792d85ee128897eb51713d1e8b44a1789c2b')
sha256sums_aarch64=('bd8c8756943a75f4b6d120b5a9b215a56d071a4fc986ff91af2a4b01e1ac6aea'
                    'e96e7109071c81dceb421cd00b3ba29af6bd0507a87f19af098a334729e54d58'
                    'e8fc8e8530e7f7c2b038fe0ffc97792d85ee128897eb51713d1e8b44a1789c2b')

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
