# Maintainer: Ayushmaan Padhi <padhiayushmaan@gmail.com>
# Co-maintainer: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=cloudflare-warp-minimal-bin
pkgver=2026.8.2100
pkgrel=1
pkgdesc="Minimal Cloudflare WARP client"
arch=('x86_64')
url="https://developers.cloudflare.com/warp-client"
license=('LicenseRef-Unknown')
install=${pkgname}.install
depends=('glibc' 'tpm2-tss' 'libgcc' 'nss' 'dbus' 'nftables')
provides=('cloudflare-warp-bin' 'cloudflare-warp')
conflicts=('cloudflare-warp-bin' 'cloudflare-warp')
source=("https://pkg.cloudflareclient.com/pool/trixie/main/c/cloudflare-warp/cloudflare-warp_${pkgver}.0_amd64.deb")
#Debian Package Index: https://pkg.cloudflareclient.com/dists/trixie/main/binary-amd64/Packages
sha256sums=('e22c0310206b904da3368c94defa1e6db88865ac1905ccf007cb416eefadafe5')

prepare() {
    bsdtar -xzf data.tar.gz -C "$srcdir"
}

package() {
    install -Dm755 bin/warp-cli "$pkgdir/usr/bin/warp-cli"
    install -Dm755 bin/warp-svc "$pkgdir/usr/bin/warp-svc"
    install -Dm644 lib/systemd/system/warp-svc.service "$pkgdir/usr/lib/systemd/system/warp-svc.service"
    sed -i 's|^ExecStart=/bin/warp-svc|ExecStart=/usr/bin/warp-svc|' "$pkgdir/usr/lib/systemd/system/warp-svc.service"
}
