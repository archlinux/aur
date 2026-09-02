# Maintainer: Ayushmaan Padhi <padhiayushmaan@gmail.com>
# Co-maintainer: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=cloudflare-warp-minimal-bin
#todo: remove .0 from pkgver, add it to source for regex for nvchecker
pkgver=2026.7.1377.0
pkgrel=2
pkgdesc="Minimal Cloudflare WARP client"
arch=('x86_64')
url="https://developers.cloudflare.com/warp-client"
license=('LicenseRef-Unknown')
depends=('glibc' 'tpm2-tss' 'libgcc' 'nss' 'dbus' 'nftables')
provides=('cloudflare-warp-bin' 'cloudflare-warp')
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
