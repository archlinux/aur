# Maintainer: 0xGingi <0xgingi@0xgingi.com>
pkgname=('jellyfin-rpc-bin')
pkgver=1.1.0
pkgrel=2
pkgdesc="Displays the content you're currently watching on Discord"
arch=('x86_64')
url="https://github.com/Radiicall/jellyfin-rpc"
license=('GPL3')
depends=('glibc' 'gcc-libs')
makedepends=('git')
provides=('jellyfin-rpc')
conflicts=('jellyfin-rpc')
source=("https://github.com/Radiicall/jellyfin-rpc/releases/download/$pkgver/jellyfin-rpc-x86_64-linux"
    "git+https://github.com/Radiicall/jellyfin-rpc"
    "https://raw.githubusercontent.com/Radiicall/jellyfin-rpc/$pkgver/scripts/jellyfin-rpc.service")
md5sums=('d4c753b2abcae4291339cba2a44b4d5e'
         'SKIP'
         'd962dcaa648d0337f92844149295d94c')
install=jellyfin-rpc-bin.install 

prepare() {
    sed -i "s|^ExecStart=.*\$|ExecStart=/usr/lib/jellyfin-rpc/jellyfin-rpc|" jellyfin-rpc.service
}

package() {
    install -Dm0755 ./jellyfin-rpc-x86_64-linux "$pkgdir/usr/lib/jellyfin-rpc/jellyfin-rpc"
    install -Dm0644  jellyfin-rpc/example.json  "$pkgdir/usr/lib/jellyfin-rpc/example.json"
    install -Dm0644 ./jellyfin-rpc.service "$pkgdir/usr/lib/systemd/user/jellyfin-rpc.service"
}