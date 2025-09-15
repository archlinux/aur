# Maintainer: Ayushmaan Padhi <padhiayushmaan@gmail.com>

pkgname=cloudflare-warp-minimal-bin
pkgver=2025.6.1335.0
pkgrel=2
pkgdesc="Minimal Cloudflare WARP client"
arch=('x86_64')
url="https://developers.cloudflare.com/warp-client"
license=('custom')
depends=('glibc' 'nftables'  'nspr' 'nss')
provides=('cloudflare-warp-minimal-bin')
conflicts=('cloudflare-warp-bin' 'cloudflare-warp')
source=("https://pkg.cloudflareclient.com/pool/bookworm/main/c/cloudflare-warp/cloudflare-warp_${pkgver}_amd64.deb")
sha256sums=('f1be243ada8c3257bc4efee3bd576e85fa6d713a9dc2d58fddd067600bf866ce')

prepare() {
    cd "$srcdir"
    bsdtar -xzf data.tar.gz -C "$srcdir"
}

package() {
    cd "$srcdir"
    install -Dm755 bin/warp-cli          "$pkgdir/usr/bin/warp-cli"
    install -Dm755 bin/warp-svc          "$pkgdir/usr/bin/warp-svc"
    install -Dm644 lib/systemd/system/warp-svc.service "$pkgdir/usr/lib/systemd/system/warp-svc.service"
    sudo sed -i 's|^ExecStart=/bin/warp-svc|ExecStart=/usr/bin/warp-svc|' "$pkgdir/usr/lib/systemd/system/warp-svc.service"
}
