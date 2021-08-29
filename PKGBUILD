# Maintainer: Hao Long <aur@esd.cc>

pkgname=cloudflared-bin
pkgver=2021.8.7
pkgrel=1
pkgdesc="An Argo Tunnel client which proxies any local webserver through the Cloudflare network"
arch=("x86_64" "i686" "aarch64" "armv6h" "armv7h")
url="https://developers.cloudflare.com/argo-tunnel/"
_url="https://github.com/cloudflare/cloudflared"
license=("custom")
depends=("glibc")
provides=("cloudflared")
conflicts=("cloudflared")
source=("https://raw.githubusercontent.com/cloudflare/cloudflared/master/LICENSE"
        "cloudflared.yml"
        "cloudflared@.service"
        "cloudflared-dns.service"
        "sysusers.d")
source_x86_64=("${pkgname}-x86_64-${pkgver}::${_url}/releases/download/${pkgver}/cloudflared-linux-amd64")
source_i686=("${pkgname}-386-${pkgver}::${_url}/releases/download/${pkgver}/cloudflared-linux-386")
source_aarch64=("${pkgname}-aarch64-${pkgver}::${_url}/releases/download/${pkgver}/cloudflared-linux-arm64")
source_armv6h=("${pkgname}-armv6h-${pkgver}::${_url}/releases/download/${pkgver}/cloudflared-linux-arm")
source_armv7h=("${pkgname}-armv7h-${pkgver}::${_url}/releases/download/${pkgver}/cloudflared-linux-arm")
sha256sums=('6a486a0f6c00e87cce1caf0aa8db45ea9fefd0bf91d9be6fc44460160dc0dbda'
            'e769786afdfbd486a4d7ca99495dbe955c25e41b5e012b722b018ca17f269dac'
            '83234a52452dce5497dd04e27323b2f83c702d4435a2687d1be4f829451fb061'
            'bc40e3f7e1b21b93a949a1b1c05639584943d9ce9cc7ccb96612688eeb9fd206'
            'bfda935c07b8e49821ee13e19433b1ed475ebb651e3008a32950734afbaef813')
sha256sums_x86_64=('5a3e6ef3958c55f7560eed97673406d3900ecf8334acb1f6feda3590bf6403d6')
sha256sums_i686=('aab6cfa03cdebe0a67301d4a7fd1a73f40d39507b101944e65fbcf4310a0ea19')
sha256sums_aarch64=('c897eaf9650426f75373a49a642a70848987388de88d23d068723e6616370045')
sha256sums_armv6h=('e7ad1fe2db9d3e2e3a28ce5ca18b371ddb95d04d035f31245c7d6d352d16763e')
sha256sums_armv7h=('e7ad1fe2db9d3e2e3a28ce5ca18b371ddb95d04d035f31245c7d6d352d16763e')

package() {
  # Install License
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  # Install Binary
  install -Dm755 cloudflared-bin-* ${pkgdir}/usr/bin/cloudflared

  # Configuration File
  install -Dm644 cloudflared.yml ${pkgdir}/etc/cloudflared/cloudflared.yml.example
  install -Dm644 -t ${pkgdir}/usr/lib/systemd/system cloudflared{@,-dns}.service

  # Post install
  install -Dm644 sysusers.d ${pkgdir}/usr/lib/sysusers.d/cloudflared.conf
}
