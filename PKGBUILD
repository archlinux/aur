# Maintainer: Spider.007 <aur@spider007.net>
# Maintainer: chengxuncc <chengxuncc@gmail.com>

pkgname=prysm
pkgver=6.0.0
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
sha256sums_x86_64=('7d1129c23bccdc9dcd901d4a98d1b4cfac50e129a25908032af1ec3c6521fada'
                   'dedbf866f649e0044294b4c8087aa1b6599efd4e226ab804a9e4bda854cbc471'
                   'da01771781c25fbecfa3b30b5e8981f33c16c68e8278830b26ca3b33e735d34f')
sha256sums_aarch64=('7d1129c23bccdc9dcd901d4a98d1b4cfac50e129a25908032af1ec3c6521fada'
                    'dedbf866f649e0044294b4c8087aa1b6599efd4e226ab804a9e4bda854cbc471'
                    'da01771781c25fbecfa3b30b5e8981f33c16c68e8278830b26ca3b33e735d34f')

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
