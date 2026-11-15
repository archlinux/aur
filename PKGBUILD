pkgname=trusttunnel-client
pkgver=1.1.12
pkgrel=2
pkgdesc="Modern, open-source VPN protocol client by AdGuard"
arch=('x86_64' 'aarch64')
url="https://github.com/TrustTunnel/TrustTunnelClient"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
source=('trusttunnel-client.service')
sha256sums=('c742f56b78e7be2556983f28481f295b58177d9d8b33938f2d3f411052b2c8ea')

source_x86_64=("trusttunnel_client-v$pkgver-linux-x86_64-$pkgver.tar.gz::$url/releases/download/v$pkgver/trusttunnel_client-v$pkgver-linux-x86_64.tar.gz")
source_aarch64=("trusttunnel_client-v$pkgver-linux-aarch64-$pkgver.tar.gz::$url/releases/download/v$pkgver/trusttunnel_client-v$pkgver-linux-aarch64.tar.gz")

sha256sums_x86_64=('75b7df59351e26462487464de5f3462153e00195f2d40677872fb93a5b44c488')
sha256sums_aarch64=('10402be7e715f35380e8bcf67e2d8f2ceb9fad81eef8274a472e3a085a0d5cc1')

package() {
  if [ "$CARCH" == "x86_64" ]; then
    _dir="trusttunnel_client-v$pkgver-linux-x86_64"
  elif [ "$CARCH" == "aarch64" ]; then
    _dir="trusttunnel_client-v$pkgver-linux-aarch64"
  fi

  cd "$_dir"

  # Binaries
  install -Dm755 "trusttunnel_client" "$pkgdir/usr/bin/trusttunnel-client"
  install -Dm755 "setup_wizard" "$pkgdir/usr/bin/trusttunnel-client-setup-wizard"

  # Service (using the official template from the tarball)
  install -Dm644 "$srcdir/trusttunnel-client.service" "$pkgdir/usr/lib/systemd/system/trusttunnel-client.service"

  # Docs and License
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
