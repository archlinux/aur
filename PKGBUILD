# Maintainer: Hao Long <aur@esd.cc>

pkgname=cloudflared-bin
pkgver=2021.5.6
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
source_x86_64=("https://bin.equinox.io/a/76PhW5z8qEi/cloudflared-2021.5.6-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/e6gwypSfaqY/cloudflared-2021.5.6-linux-386.tar.gz")
source_armv6h=("https://bin.equinox.io/a/c3bqNgo7uir/cloudflared-2021.5.6-linux-arm.tar.gz")
source_armv7h=("https://bin.equinox.io/a/c3bqNgo7uir/cloudflared-2021.5.6-linux-arm.tar.gz")
sha256sums=('6a486a0f6c00e87cce1caf0aa8db45ea9fefd0bf91d9be6fc44460160dc0dbda'
            'e769786afdfbd486a4d7ca99495dbe955c25e41b5e012b722b018ca17f269dac'
            '83234a52452dce5497dd04e27323b2f83c702d4435a2687d1be4f829451fb061'
            'bc40e3f7e1b21b93a949a1b1c05639584943d9ce9cc7ccb96612688eeb9fd206'
            'bfda935c07b8e49821ee13e19433b1ed475ebb651e3008a32950734afbaef813')
sha256sums_x86_64=('42ca50baa3a0a686a835db5485486d64e73a57c00b9094ea4d1b2c493f966ceb')
sha256sums_i686=('4c05dea145d0fa362207163b4e3b5142828cd3435982e540b4cdbc2892e86526')
sha256sums_armv6h=('8c1aa5c8332e862eb0c17482779ac8fb48f009b641746e5f4b7e544f47585cd8')
sha256sums_armv7h=('8c1aa5c8332e862eb0c17482779ac8fb48f009b641746e5f4b7e544f47585cd8')

package() {
  # Install License
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  # Install Binary
  install -Dm755 cloudflared ${pkgdir}/usr/bin/cloudflared

  # Configuration File
  install -Dm644 cloudflared.yml ${pkgdir}/etc/cloudflared/cloudflared.yml.example
  install -Dm644 -t ${pkgdir}/usr/lib/systemd/system cloudflared{@,-dns}.service

  # Post install
  install -Dm644 sysusers.d ${pkgdir}/usr/lib/sysusers.d/cloudflared.conf
}
