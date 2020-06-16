# Maintainer: Hao Long <aur@esd.cc>

pkgname=cloudflared-bin
pkgver=2020.6.3
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
source_x86_64=("https://bin.equinox.io/a/2HyzbE6cNGQ/cloudflared-2020.6.3-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/fETyYMcUYXB/cloudflared-2020.6.3-linux-386.tar.gz")
source_armv6h=("https://bin.equinox.io/a/apsHR23f7YB/cloudflared-2020.6.3-linux-arm.tar.gz")
source_armv7h=("https://bin.equinox.io/a/apsHR23f7YB/cloudflared-2020.6.3-linux-arm.tar.gz")
sha256sums=('6a486a0f6c00e87cce1caf0aa8db45ea9fefd0bf91d9be6fc44460160dc0dbda'
            'e769786afdfbd486a4d7ca99495dbe955c25e41b5e012b722b018ca17f269dac'
            '83234a52452dce5497dd04e27323b2f83c702d4435a2687d1be4f829451fb061'
            'bc40e3f7e1b21b93a949a1b1c05639584943d9ce9cc7ccb96612688eeb9fd206'
            'bfda935c07b8e49821ee13e19433b1ed475ebb651e3008a32950734afbaef813')
sha256sums_x86_64=('95ffd2e12b0139c8cfd5d9b2d2bdfac90da9ca8e117fac61469689b5ba3ae09d')
sha256sums_i686=('6a394d5fcc8a7f28d81dd4721ee51785b93142e840f6756df00bca8470d90448')
sha256sums_armv6h=('7f69b2e6bcd713afeb7554a0455a66d3f9cfc01c4dfa35b2a8ed037e4b7551d3')
sha256sums_armv7h=('7f69b2e6bcd713afeb7554a0455a66d3f9cfc01c4dfa35b2a8ed037e4b7551d3')

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
