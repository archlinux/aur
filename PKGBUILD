# Maintainer: Konstantin Rannev <konstantin d0t rannev @t secria d0t me>

pkgname=secria-vpn-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="Native client with WireGuard and the post-quantum preshared key"
arch=('x86_64' 'aarch64')
url="https://secria.me"
license=('LicenseRef-SecriaTerms')
depends=('wireguard-tools' 'nftables' 'iproute2' 'hicolor-icon-theme')
provides=("${pkgname%-bin}=$pkgver")
conflicts=("${pkgname%-bin}")

source=("LICENSE")
sha256sums=('b082d2bb6f0da30ec8686931e15caa4e00dd2e642f4f033440680783465f5b14')

source_x86_64=("https://secria.me/download/linux/${pkgname%-bin}-${pkgver}-1.$CARCH.rpm")
sha256sums_x86_64=('582a1ef2b38c22c32f2b60d75951a59a2e787cb9e60a1b946b0e2345c55fdf68')

source_aarch64=("https://secria.me/download/linux/${pkgname%-bin}-${pkgver}-1.$CARCH.rpm")
sha256sums_aarch64=('de4e4660829937f6184b981d2c4ff37f6f1d4747c24f55d89fb8e22ff90ec73f')

package() {
    # RPMs are automatically extracted into $srcdir
    cd "$srcdir"

    # Move the entire usr tree to the package root
    cp -rv usr "$pkgdir/"
    
    # Install the Terms of Service as the license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
