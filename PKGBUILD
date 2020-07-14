# Maintainer: Hao Long <aur@esd.cc>

pkgname=cloudflared-bin
pkgver=2020.7.3
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
source_x86_64=("https://bin.equinox.io/a/gVhbZwCYK7M/cloudflared-2020.7.3-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/67ppz3DscsS/cloudflared-2020.7.3-linux-386.tar.gz")
source_armv6h=("https://bin.equinox.io/a/2h4RtpuNXwP/cloudflared-2020.7.3-linux-arm.tar.gz")
source_armv7h=("https://bin.equinox.io/a/2h4RtpuNXwP/cloudflared-2020.7.3-linux-arm.tar.gz")
sha256sums=('6a486a0f6c00e87cce1caf0aa8db45ea9fefd0bf91d9be6fc44460160dc0dbda'
            'e769786afdfbd486a4d7ca99495dbe955c25e41b5e012b722b018ca17f269dac'
            '83234a52452dce5497dd04e27323b2f83c702d4435a2687d1be4f829451fb061'
            'bc40e3f7e1b21b93a949a1b1c05639584943d9ce9cc7ccb96612688eeb9fd206'
            'bfda935c07b8e49821ee13e19433b1ed475ebb651e3008a32950734afbaef813')
sha256sums_x86_64=('188eaed45563d4d93ef90cd5e179fa554eca04567a46e6876c555f09146dee9a')
sha256sums_i686=('c7f934b6a9752026c6c535dd5f18822c4baba2a00aaca3d45038cc931f6ffb13')
sha256sums_armv6h=('7812e570d3aa7e73c80147b5f2d566e9ef7f8fb74b566285c435c76c25a31f7b')
sha256sums_armv7h=('7812e570d3aa7e73c80147b5f2d566e9ef7f8fb74b566285c435c76c25a31f7b')

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
