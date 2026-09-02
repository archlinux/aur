# Maintainer: Ayushmaan Padhi <padhiayushmaan@gmail.com>

pkgname=cloudflare-warp-minimal-bin
pkgver=2026.7.1377.0
pkgrel=1
pkgdesc="Minimal Cloudflare WARP client"
arch=('x86_64')
url="https://developers.cloudflare.com/warp-client"
license=('LicenseRef-Unknown')
depends=('dbus' 'glibc' 'iproute2' 'nftables' 'gnupg' 'libcap' 'nss' 'ca-certificates' 'libpcap' 'tpm2-tss')
provides=('cloudflare-warp-minimal-bin')
conflicts=('cloudflare-warp-bin' 'cloudflare-warp')
source=("https://pkg.cloudflareclient.com/pool/trixie/main/c/cloudflare-warp/cloudflare-warp_${pkgver}_amd64.deb")
#Debian Package Index: https://pkg.cloudflareclient.com/dists/trixie/main/binary-amd64/Packages
sha256sums=('5afe38d0536b49bd09509264b68018e5440b28538323e1984d8096c512062658')

prepare() {
    bsdtar -xzf data.tar.gz -C "$srcdir"
}

package() {
    install -Dm755 bin/warp-cli "$pkgdir/usr/bin/warp-cli"
    install -Dm755 bin/warp-svc "$pkgdir/usr/bin/warp-svc"
    install -Dm644 lib/systemd/system/warp-svc.service "$pkgdir/usr/lib/systemd/system/warp-svc.service"
    sed -i 's|^ExecStart=/bin/warp-svc|ExecStart=/usr/bin/warp-svc|' "$pkgdir/usr/lib/systemd/system/warp-svc.service"
}
