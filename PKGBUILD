# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=icmptunnel
_pkgver=1.0.0-alpha
pkgver=1.0.0alpha
pkgrel=1
pkgdesc="Transparently tunnel your IP traffic through ICMP echo and reply packets."
arch=('i686' 'x86_64')
url="https://github.com/DhavalKapil/icmptunnel"
license=('MIT')
depends=('net-tools')
makedepends=('git')
provides=('icmptunnel')
conflicts=('icmptunnel')
source=("https://github.com/DhavalKapil/icmptunnel/archive/$_pkgver.tar.gz"
        "http://dhaval.mit-license.org/license.txt")
sha256sums=('8479ee13f8c0c7af07ecd30d7af15cddf228ae126c1403b16283333c506dccd8'
            'e9d8fd95de3a96aa5b015e0f3afd75e7d24450f6702e0971a0f02062fd5891d4')

prepare() {
    cd "$srcdir/icmptunnel-$_pkgver"
    sed -i '/SERVER_SCRIPT/s/server.sh/\/usr\/bin\/icmptunnel-server/' tunnel.h
    sed -i '/CLIENT_SCRIPT/s/client.sh/\/usr\/bin\/icmptunnel-client/' tunnel.h
}

build(){
    cd "$srcdir/icmptunnel-$_pkgver"
    make
}

package(){
    cd "$srcdir/icmptunnel-$_pkgver"
    install -Dm0755 icmptunnel "$pkgdir"/usr/bin/icmptunnel

    install -Dm0755 client.sh "$pkgdir"/usr/bin/icmptunnel-client
    install -Dm0755 server.sh "$pkgdir"/usr/bin/icmptunnel-server

    install -Dm0644 "$srcdir/license.txt" \
        "$pkgdir/usr/share/licenses/icmptunnel/license.txt"
}
