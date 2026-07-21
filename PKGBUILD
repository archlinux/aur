# Maintainer: Konstantin Rannev <konstantin d0t rannev @t secria d0t me>

pkgname=secria-vpn-bin
pkgver=1.0.5
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

source_x86_64=("https://secria.me/download/linux/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums_x86_64=('e2756c5792f09a606d497f2aa32e4bce2d6c03701c089abcdf287b0f9040f9c7')

source_aarch64=("https://secria.me/download/linux/${pkgname%-bin}_${pkgver}_arm64.deb")
sha256sums_aarch64=('5e713ef4f6b8edb4edd1ea26dbd279dd2a1b9fc38b4dcf9eae67f0121d6dbbac')

package() {
    # RPMs are automatically extracted into $srcdir
    cd "$srcdir"

    # Extract the data archive into the package root
    bsdtar -xf data.tar.xz -C "$pkgdir/"
    
    # Install the Terms of Service as the license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
