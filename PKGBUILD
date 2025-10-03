# Maintainer: Ayushmaan Padhi <padhiayushmaan@gmail.com>

pkgname=cloudflare-warp-minimal-bin
pkgver=2025.7.176.0
pkgrel=1
pkgdesc="Minimal Cloudflare WARP client"
arch=('x86_64')
url="https://developers.cloudflare.com/warp-client"
license=('custom')
depends=('ca-certificates' 'glibc' 'gnupg' 'iproute2' 'libcap' 'libdbus' 'libpcap' 'nftables'  'nspr' 'nss')
provides=('cloudflare-warp-minimal-bin')
conflicts=('cloudflare-warp-bin' 'cloudflare-warp')
source=("https://pkg.cloudflareclient.com/pool/trixie/main/c/cloudflare-warp/cloudflare-warp_${pkgver}_amd64.deb")
#Debian Package Index: https://pkg.cloudflareclient.com/dists/trixie/main/binary-amd64/Packages
sha256sums=('1e316db69619eb4053b172fdcf4492e09f303677ed2ed84fbec6b94996f763b6')

prepare() {
    bsdtar -xzf data.tar.gz -C "$srcdir"
}

package() {
    install -Dm755 bin/warp-cli "$pkgdir/usr/bin/warp-cli"
    install -Dm755 bin/warp-svc "$pkgdir/usr/bin/warp-svc"
    install -Dm644 lib/systemd/system/warp-svc.service "$pkgdir/usr/lib/systemd/system/warp-svc.service"
    sudo sed -i 's|^ExecStart=/bin/warp-svc|ExecStart=/usr/bin/warp-svc|' "$pkgdir/usr/lib/systemd/system/warp-svc.service"
}
