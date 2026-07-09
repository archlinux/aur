# Maintainer: Ayushmaan Padhi <padhiayushmaan@gmail.com>

pkgname=cloudflare-warp-minimal-bin
pkgver=2026.6.836.0
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
sha256sums=('bfd0f9dac4cfbd55a1e9c684c9927feaee9e310029021ec7e0d780ff6ec82d5b')

prepare() {
    bsdtar -xzf data.tar.gz -C "$srcdir"
}

package() {
    install -Dm755 bin/warp-cli "$pkgdir/usr/bin/warp-cli"
    install -Dm755 bin/warp-svc "$pkgdir/usr/bin/warp-svc"
    install -Dm644 lib/systemd/system/warp-svc.service "$pkgdir/usr/lib/systemd/system/warp-svc.service"
    sudo sed -i 's|^ExecStart=/bin/warp-svc|ExecStart=/usr/bin/warp-svc|' "$pkgdir/usr/lib/systemd/system/warp-svc.service"
}
