# Maintainer: Hao Long <aur@esd.cc>

pkgname=cloudflared-bin
pkgver=2021.5.10
pkgrel=1
pkgdesc="An Argo Tunnel client which proxies any local webserver through the Cloudflare network"
arch=("x86_64" "i686" "armv6h" "armv7h")
url="https://developers.cloudflare.com/argo-tunnel/"
license=("custom")
depends=("glibc")
provides=("cloudflared")
conflicts=("cloudflared")
source=("https://raw.githubusercontent.com/cloudflare/cloudflared/master/LICENSE"
        "cloudflared.yml"
        "cloudflared@.service"
        "cloudflared-dns.service"
        "sysusers.d")
source_x86_64=("https://github.com/cloudflare/cloudflared/releases/download/${pkgver}/cloudflared-linux-amd64")
source_i686=("https://github.com/cloudflare/cloudflared/releases/download/${pkgver}/cloudflared-linux-386")
source_armv6h=("https://github.com/cloudflare/cloudflared/releases/download/${pkgver}/cloudflared-linux-armv6")
source_armv7h=("https://github.com/cloudflare/cloudflared/releases/download/${pkgver}/cloudflared-linux-armv6")
sha256sums=('6a486a0f6c00e87cce1caf0aa8db45ea9fefd0bf91d9be6fc44460160dc0dbda'
            'e769786afdfbd486a4d7ca99495dbe955c25e41b5e012b722b018ca17f269dac'
            '83234a52452dce5497dd04e27323b2f83c702d4435a2687d1be4f829451fb061'
            'bc40e3f7e1b21b93a949a1b1c05639584943d9ce9cc7ccb96612688eeb9fd206'
            'bfda935c07b8e49821ee13e19433b1ed475ebb651e3008a32950734afbaef813')
sha256sums_x86_64=('de705d95b546e6192c31c4321a1c1a9ae3cb8a488e8595ab51e2661187038129')
sha256sums_i686=('fca00f4f14ff2932e926333419b6dffa5f0e272cc9ce2dbcfbe95ba02b95a419')
sha256sums_armv6h=('2bf6a54d19120ab63d7f9b37909ab0296a08e03b8b87eeef3349eb21b89366f6')
sha256sums_armv7h=('2bf6a54d19120ab63d7f9b37909ab0296a08e03b8b87eeef3349eb21b89366f6')

package() {
  # Install License
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  # Install Binary
  install -Dm755 cloudflared-linux-* ${pkgdir}/usr/bin/cloudflared

  # Configuration File
  install -Dm644 cloudflared.yml ${pkgdir}/etc/cloudflared/cloudflared.yml.example
  install -Dm644 -t ${pkgdir}/usr/lib/systemd/system cloudflared{@,-dns}.service

  # Post install
  install -Dm644 sysusers.d ${pkgdir}/usr/lib/sysusers.d/cloudflared.conf
}
