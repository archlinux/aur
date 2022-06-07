# Maintainer : Ilan Frumer (ilanfrumer@gmail.com)

pkgname=dragonfly-bin
pkgver=0.1.1
pkgrel=0
pkgdesc="Dragonfly is a modern in-memory datastore, fully compatible with Redis and Memcached APIs"
arch=("x86_64" "aarch64")
url="https://dragonflydb.io/"
license=('BSL')
depends=('openssl' 'boost-libs' 'libunwind')
source=("https://github.com/dragonflydb/dragonfly/releases/download/v${pkgver}/dragonfly-${arch}.tar.gz")
sha256sums=('SKIP')
pkgver() {
    curl --silent https://api.github.com/repos/dragonflydb/dragonfly/releases/latest |
        python3 -c "import sys,re,json; print(re.sub('^v','',json.load(sys.stdin)['name']))"
}

package() {
    tar -zxvf "dragonfly-$arch.tar.gz"
    mv "dragonfly-$arch" dragonfly
    install -vDm755 -t "$pkgdir/usr/bin" dragonfly
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
