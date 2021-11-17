# Maintainer: Hao Long <aur@esd.cc>

pkgname=cloudflared-bin
pkgver=2021.11.0
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
b2sums=('88c2a20908e165ef79e13799549be16b577e095c6874ede50b1d7203ae9d7c3ac22d5a645e36407cba63021f4eb95c30f103df1dc51dba451a81f8b0f609f011'
        '09ac52a248193706455b141f31da2a44f8f176b15ff062554da2c9a5e1e5a796b7d39890ed4d81e8941cedad24a0d56169251e9cb1df51097a95111165981630'
        '10ecd693cd7b310f69dce1551a0a9299c89fffafcc67c856f340c66f45263daa1a065ab3c82005856b3ee62a85a1c921db177bf99d91db64be12e4ee3114dccc'
        '2916ff952590b1322c84a390da01639f4e2656faa6d72c3f270b21c89a56bd5fb54fd54c6204736d61a0433b46427701de5a641bf68958dd03f551fe18b8bc7f'
        '38c9699663b667844e4236a4f33ff156ab0226f2144590d03e968dc73ae1a5be9510d979c408f5ff3205a057120cc54cf740732b36f361616f48dc269ae1a1a1')
b2sums_x86_64=('2e031f13b8507ce5b1b92dd9029cd0f77042c5cbe8600e7a648188ad178f2820ba9d559c96bd94dfd0a8efcdf96aed69187d0c91e592e77a29d4916c98e1ba25')
b2sums_i686=('4c6fc27008c7f1121598db044435b764e7f9f7981f7cf508fa2599b8c73a456ed9c64601e0820eb761e3c91d6932f3d03195ef338117b97fc8daa9c150822fcc')
b2sums_aarch64=('142e54a2d8a9d78fda7b09219190f0224bda3785458a1f3fd32fda0742151a7cb6d72ba5307e24c86883351d2adccf284c07a8795b4c0e9c58a98445e6598407')
b2sums_armv6h=('da3d63ff65c7042a2ab017d1f14d6a3ab25406770594032290f1b69812549f7dddbce7a7d7020c1f70f0f44e2a84e2d25627014f886a8829ad7200925ff646a8')
b2sums_armv7h=('da3d63ff65c7042a2ab017d1f14d6a3ab25406770594032290f1b69812549f7dddbce7a7d7020c1f70f0f44e2a84e2d25627014f886a8829ad7200925ff646a8')

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
