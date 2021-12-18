# Maintainer: Hao Long <aur@esd.cc>

pkgname=cloudflared-bin
pkgver=2021.12.1
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
b2sums_x86_64=('e7bdc243e1e2d3e63a2ff6a25d20be44f866e84f919f56f18310645a93cd3a49374c238ba7ff8c1111e5955fc94034463df50e826373db004d5c56846abfe75f')
b2sums_i686=('e73a12826a5194c81ecf73c0a560dd733d77fe8b0b8fdaddb1b289185ac67a62d3e4a109f594ed4fd985e8f7d7a636ed6aa8d47fb3bd27da023e734e66fbc0fa')
b2sums_aarch64=('13f7b6a37b2f89eab65bf8a9ad35593a5fac0d4e6d1ecdc56f04677a3fcb5a5553c74eff4c417623c8d56cc7c6199b8f2269fb361acb6632cdef246dbd96ec41')
b2sums_armv6h=('4f21f5447e966cb637c025a354916851c22fbaa3c250db13cccd7d950cce7f8553f121d8e455575fe211e354aed9f1a8912b0a4f68c09b75076782e8b7682d6c')
b2sums_armv7h=('4f21f5447e966cb637c025a354916851c22fbaa3c250db13cccd7d950cce7f8553f121d8e455575fe211e354aed9f1a8912b0a4f68c09b75076782e8b7682d6c')

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
