# Maintainer: Hao Long <aur@esd.cc>

pkgname=cloudflared-bin
pkgver=2020.6.1
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
source_x86_64=("https://bin.equinox.io/a/W8zBUSyawx/cloudflared-2020.6.1-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/aKktzTNvq6t/cloudflared-2020.6.1-linux-386.tar.gz")
source_armv6h=("https://bin.equinox.io/a/55TMWJxcqU9/cloudflared-2020.6.1-linux-arm.tar.gz")
source_armv7h=("https://bin.equinox.io/a/55TMWJxcqU9/cloudflared-2020.6.1-linux-arm.tar.gz")
sha256sums=('6a486a0f6c00e87cce1caf0aa8db45ea9fefd0bf91d9be6fc44460160dc0dbda'
            'e769786afdfbd486a4d7ca99495dbe955c25e41b5e012b722b018ca17f269dac'
            '83234a52452dce5497dd04e27323b2f83c702d4435a2687d1be4f829451fb061'
            'bc40e3f7e1b21b93a949a1b1c05639584943d9ce9cc7ccb96612688eeb9fd206'
            'bfda935c07b8e49821ee13e19433b1ed475ebb651e3008a32950734afbaef813')
sha256sums_x86_64=('fb88f19115d570952aa0375dba948d0cb5cf8b3535bc5714964e24f7501dc022')
sha256sums_i686=('a44557a1ea65c84996e3912eb2a2bca5fb821597be4b62514e22aa51b9b145ec')
sha256sums_armv6h=('266e5ec07b0ababa0dc86bac2a8ce768d189ff1b3ae75403c82be47b974e5349')
sha256sums_armv7h=('266e5ec07b0ababa0dc86bac2a8ce768d189ff1b3ae75403c82be47b974e5349')

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
