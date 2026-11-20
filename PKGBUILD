pkgname=trusttunnel-client
pkgver=1.3.0
pkgrel=1
pkgdesc="Modern, open-source VPN protocol client by AdGuard"
arch=('x86_64' 'aarch64')
url="https://github.com/TrustTunnel/TrustTunnelClient"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
source=('trusttunnel-client.service')
sha256sums=('c742f56b78e7be2556983f28481f295b58177d9d8b33938f2d3f411052b2c8ea')
sha256sums_x86_64=('99e764bb2c080f7a60c441b51ad75fa7ec00e6c8a80afe36030af37201ba32f7')
sha256sums_aarch64=('837ec64520d546cdf8e7a327614589f64dc6c4f30e408e3788de7bfaef05b52b')

source_x86_64=("trusttunnel_client-v$pkgver-linux-x86_64-$pkgver.tar.gz::$url/releases/download/v$pkgver/trusttunnel_client-v$pkgver-linux-x86_64.tar.gz")
source_aarch64=("trusttunnel_client-v$pkgver-linux-aarch64-$pkgver.tar.gz::$url/releases/download/v$pkgver/trusttunnel_client-v$pkgver-linux-aarch64.tar.gz")


package() {
  if [ "$CARCH" == "x86_64" ]; then
    _dir="trusttunnel_client-v$pkgver-linux-x86_64"
  elif [ "$CARCH" == "aarch64" ]; then
    _dir="trusttunnel_client-v$pkgver-linux-aarch64"
  fi

  cd "$_dir"

  # Binaries
  install -Dm755 "trusttunnel_client" "$pkgdir/usr/bin/trusttunnel-client"
#  install -Dm755 "setup_wizard" "$pkgdir/usr/bin/trusttunnel-client-setup-wizard"

  # Service (using the official template from the tarball)
  install -Dm644 "$srcdir/trusttunnel-client.service" "$pkgdir/usr/lib/systemd/system/trusttunnel-client.service"

  # Docs and License
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
