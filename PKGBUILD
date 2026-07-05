# Maintainer: LeviSnoot <hello@levi.land>
pkgname=('jellyfin-rpc-bin')
pkgver=1.3.5
pkgrel=1
pkgdesc="Displays the content you're currently watching on Discord"
arch=('x86_64')
url="https://github.com/JustRadical/jellyfin-rpc"
license=('GPL3')
depends=('glibc' 'gcc-libs')
makedepends=('git')
provides=('jellyfin-rpc')
conflicts=('jellyfin-rpc')
source=("https://github.com/JustRadical/jellyfin-rpc/releases/download/$pkgver/jellyfin-rpc-x86_64-linux"
    "git+https://github.com/JustRadical/jellyfin-rpc"
    "https://raw.githubusercontent.com/JustRadical/jellyfin-rpc/$pkgver/scripts/jellyfin-rpc.service")
sha256sums=('d723ad43662d08b2d489bf58de5669747e69bc01ed971b1907666cc8de65a1d9'
'SKIP'
'0b8944f8f089a5beb53ffe654c145067d4cbd4e65fe2e2cd20d65a985d6f7d81')
install=jellyfin-rpc-bin.install 

prepare() {
    sed -i "s|^ExecStart=.*\$|ExecStart=/usr/lib/jellyfin-rpc/jellyfin-rpc|" jellyfin-rpc.service
}

package() {
    install -Dm0755 ./jellyfin-rpc-x86_64-linux "$pkgdir/usr/lib/jellyfin-rpc/jellyfin-rpc"
    install -Dm0644  jellyfin-rpc/example.json  "$pkgdir/usr/lib/jellyfin-rpc/example.json"
    install -Dm0644 ./jellyfin-rpc.service "$pkgdir/usr/lib/systemd/user/jellyfin-rpc.service"
}
