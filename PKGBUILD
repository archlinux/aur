# Maintainer: Hao Long <aur@esd.cc>

pkgname=cloudflared-bin
pkgver=2020.3.2
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
source_x86_64=("https://bin.equinox.io/a/CoKQ7Dvgfj/cloudflared-2020.3.2-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/b41FNJFRWVb/cloudflared-2020.3.2-linux-386.tar.gz")
source_armv6h=("https://bin.equinox.io/a/jdRLY4Jx4Fw/cloudflared-2020.3.2-linux-arm.tar.gz")
source_armv7h=("https://bin.equinox.io/a/jdRLY4Jx4Fw/cloudflared-2020.3.2-linux-arm.tar.gz")
sha256sums=('6a486a0f6c00e87cce1caf0aa8db45ea9fefd0bf91d9be6fc44460160dc0dbda'
            'e769786afdfbd486a4d7ca99495dbe955c25e41b5e012b722b018ca17f269dac'
            '83234a52452dce5497dd04e27323b2f83c702d4435a2687d1be4f829451fb061'
            'bc40e3f7e1b21b93a949a1b1c05639584943d9ce9cc7ccb96612688eeb9fd206'
            'bfda935c07b8e49821ee13e19433b1ed475ebb651e3008a32950734afbaef813')
sha256sums_x86_64=('e5823a00e5977c02625bb273f18d1f8251f3548f54aea6a31fbe34e381cc5d59')
sha256sums_i686=('c1e45aead25d39bfe3dbe238da87f4ba232d4b45ea199103713d7fb5622a8b13')
sha256sums_armv6h=('61ceedcb83fa54d90772f98c70e3eeff6224bc63fea594f634a1864dcc4c8c37')
sha256sums_armv7h=('61ceedcb83fa54d90772f98c70e3eeff6224bc63fea594f634a1864dcc4c8c37')

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
