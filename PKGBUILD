# Maintainer: Hao Long <aur@esd.cc>

pkgname=cloudflared-bin
pkgver=2021.12.3
pkgrel=2
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
b2sums=('88c2a20908e165ef79e13799549be16b577e095c6874ede50b1d7203ae9d7c3ac22d5a645e36407cba63021f4eb95c30f103df1dc51dba451a81f8b0f609f011'
        '09ac52a248193706455b141f31da2a44f8f176b15ff062554da2c9a5e1e5a796b7d39890ed4d81e8941cedad24a0d56169251e9cb1df51097a95111165981630'
        '58a75132893249f1a13096400019add31d997f122aaa6b282a85c6dc15fa17d842f5d7037f484d2eb88cb9214765043746a4542b1ea1dc61794a09d7b0a83ec1'
        '2916ff952590b1322c84a390da01639f4e2656faa6d72c3f270b21c89a56bd5fb54fd54c6204736d61a0433b46427701de5a641bf68958dd03f551fe18b8bc7f'
        '38c9699663b667844e4236a4f33ff156ab0226f2144590d03e968dc73ae1a5be9510d979c408f5ff3205a057120cc54cf740732b36f361616f48dc269ae1a1a1')
b2sums_x86_64=('1defab4b6537794b201ee8c3ac2e0e128d5f115d3633b37e39a6826af61bead416a99c7374e355d772566fc7171d41cc8e0419a179306fde7a43bb130ee97441')
b2sums_i686=('ba7ce15d80952a65f868a6a16d7d3e82c1112cae614c53b6d605c31ad8bfe8a60061742d4be0af0c52c677fa8246abc61b9f891dbab3a49c35f536666b73f118')
b2sums_aarch64=('ed060d01117b214d9cb58cb0e05ac554c64445ae7014555b6b90fa850283edf5eb797382e3fe27a4134b066c019d782232b7a162a8c1099f6dde51a266ef39aa')
b2sums_armv6h=('5700175dd24aded2ca2f58e51465d24d878ff487aeff56d5a7d64dc67d4e3b34ce4a983b57a854bda0d1dbd44f9d43b36ca263c2299b299945be1c0bd761848c')
b2sums_armv7h=('5700175dd24aded2ca2f58e51465d24d878ff487aeff56d5a7d64dc67d4e3b34ce4a983b57a854bda0d1dbd44f9d43b36ca263c2299b299945be1c0bd761848c')

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
