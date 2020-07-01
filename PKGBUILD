# Maintainer: Hao Long <aur@esd.cc>

pkgname=cloudflared-bin
pkgver=2020.6.6
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
source_x86_64=("https://bin.equinox.io/a/cT4NEKx87xg/cloudflared-2020.6.6-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/7jxEUq4jG5e/cloudflared-2020.6.6-linux-386.tar.gz")
source_armv6h=("https://bin.equinox.io/a/3fZm4dydcVQ/cloudflared-2020.6.6-linux-arm.tar.gz")
source_armv7h=("https://bin.equinox.io/a/3fZm4dydcVQ/cloudflared-2020.6.6-linux-arm.tar.gz")
sha256sums=('6a486a0f6c00e87cce1caf0aa8db45ea9fefd0bf91d9be6fc44460160dc0dbda'
            'e769786afdfbd486a4d7ca99495dbe955c25e41b5e012b722b018ca17f269dac'
            '83234a52452dce5497dd04e27323b2f83c702d4435a2687d1be4f829451fb061'
            'bc40e3f7e1b21b93a949a1b1c05639584943d9ce9cc7ccb96612688eeb9fd206'
            'bfda935c07b8e49821ee13e19433b1ed475ebb651e3008a32950734afbaef813')
sha256sums_x86_64=('5965a2594646c94ac2447071b570e2e02dda7b306d639df368b83248597d8534')
sha256sums_i686=('6a0ca8b5bd28ec580fbcbbbacd51440f1c97f780d9371ea49f57af92a46c8cb0')
sha256sums_armv6h=('6cfc7ea4f4ee2ea5c86ed252ff56cc7c70b6c690c1fc44297d50118c0153173f')
sha256sums_armv7h=('6cfc7ea4f4ee2ea5c86ed252ff56cc7c70b6c690c1fc44297d50118c0153173f')

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
