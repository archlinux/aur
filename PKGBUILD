# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=icmptunnel
pkgver=1.0.0
pkgrel=1
pkgdesc="Transparently tunnel your IP traffic through ICMP echo and reply packets."
arch=(i686 x86_64)
url=https://github.com/DhavalKapil/icmptunnel
license=(MIT)
depends=(bash)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz
        http://dhaval.mit-license.org/license.txt)
sha256sums=('8f743f18856c43295678c57cb435f44c16e2bdeb3a4b8b59be05c372fb725877'
            '48c6c6c6d385682c5ad938d7db7f52b895cdef3b0fe3394f8a332433e653c7f1')

prepare() {
    cd $pkgname-$pkgver
    sed -i '/SERVER_SCRIPT/s/server.sh/\/usr\/bin\/icmptunnel-server/' tunnel.h
    sed -i '/CLIENT_SCRIPT/s/client.sh/\/usr\/bin\/icmptunnel-client/' tunnel.h
}

build(){
    cd $pkgname-$pkgver
    make
}

package(){
    cd $pkgname-$pkgver
    install -Dm0755 icmptunnel "$pkgdir/usr/bin/icmptunnel"

    install -Dm0755 client.sh "$pkgdir/usr/bin/icmptunnel-client"
    install -Dm0755 server.sh "$pkgdir/usr/bin/icmptunnel-server"

    install -Dm0644 "$srcdir/license.txt" \
        "$pkgdir/usr/share/licenses/icmptunnel/license.txt"
}
