# Maintainer: Hao Long <aur@esd.cc>

pkgname=cloudflared-bin
pkgver=2020.11.6
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
source_x86_64=("https://bin.equinox.io/a/42xG3r4gFs4/cloudflared-2020.11.6-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/6Dh4vdr4n58/cloudflared-2020.11.6-linux-386.tar.gz")
source_armv6h=("https://bin.equinox.io/a/5qL7pYpp5as/cloudflared-2020.11.6-linux-arm.tar.gz")
source_armv7h=("https://bin.equinox.io/a/5qL7pYpp5as/cloudflared-2020.11.6-linux-arm.tar.gz")
sha256sums=('6a486a0f6c00e87cce1caf0aa8db45ea9fefd0bf91d9be6fc44460160dc0dbda'
            'e769786afdfbd486a4d7ca99495dbe955c25e41b5e012b722b018ca17f269dac'
            '83234a52452dce5497dd04e27323b2f83c702d4435a2687d1be4f829451fb061'
            'bc40e3f7e1b21b93a949a1b1c05639584943d9ce9cc7ccb96612688eeb9fd206'
            'bfda935c07b8e49821ee13e19433b1ed475ebb651e3008a32950734afbaef813')
sha256sums_x86_64=('ea089970b3641bdbbf6f0a4bb24e25c021eb3bf5c78813287da0890f362a4ae3')
sha256sums_i686=('c8a2fa5c8603106875b3f73eec0c87b2888f866e51f76f7bb138b7887c421f2a')
sha256sums_armv6h=('0a6ebb0627cbd8023bdf686fc48079690d25ec33b590ed73e8eab549a9319ac5')
sha256sums_armv7h=('0a6ebb0627cbd8023bdf686fc48079690d25ec33b590ed73e8eab549a9319ac5')

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
