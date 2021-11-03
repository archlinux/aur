# Maintainer: Hao Long <aur@esd.cc>

pkgname=cloudflared-bin
pkgver=2021.10.5
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
b2sums_x86_64=('e92612a63b2c98fa64f03d63db829103a20762fd937e481dd612ab57aec03b284dbe2723f459a24555fe5f4528061f36e0a802099df38e253fa93cb93c9f83b0')
b2sums_i686=('319d564a80c1b0e976371585a128b90550882a1bfcb7006c3c29cfc340f5959cf04766fb86a7d0f3559e73edde8548d6f0b0eb248fc4b1f8ecbb39df8a330143')
b2sums_aarch64=('9229106e2ea07a4e500849ad0abdde3b2ea7200cfb74bf3f62cc3c4e50bb819fd260b900513b53408d1e977661344f838d61252279e1a95bb295c93de635439a')
b2sums_armv6h=('fc3f87747b44ea88e3f94e816b4a17f9a3813107d83e30e03cf1d26ead28493a056ccfb3b9bfdeac81e9971e2f039cdf1c822944d6ae25abd8ff227adca108ed')
b2sums_armv7h=('fc3f87747b44ea88e3f94e816b4a17f9a3813107d83e30e03cf1d26ead28493a056ccfb3b9bfdeac81e9971e2f039cdf1c822944d6ae25abd8ff227adca108ed')

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
