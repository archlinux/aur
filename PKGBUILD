# Maintainer: Zen Wen <zen.8841@gmail.com>

pkgname=zswapstat
pkgver=v1.0
pkgrel=1
pkgdesc="A simple Bash script to monitor zswap and memory status"
arch=('x86_64')
url="https://github.com/zen8841/zswapstat"
license=('AGPL-3.0-or-later')
depends=('sudo' 'bc')
makedepends=()
checkdepends=()
provides=('zswapstat')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zen8841/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('0f5a7783588327b0f45fe33f7c78e95088c1a098ef62e85535ae79c99fd543ad')
#validpgpkeys=()

prepare() {
    cd "$pkgname-$pkgver"
    sed -i 's|/usr/local/bin/zswapstat|/usr/bin/zswapstat|' zswapstat-sudoers
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 zswapstat.sh "${pkgdir}/usr/bin/zswapstat"
    install -Dm440 zswapstat-sudoers "${pkgdir}/etc/sudoers.d/zswapstat"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
