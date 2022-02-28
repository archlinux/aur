# Maintainer: Hao Long <aur@esd.cc>

pkgname=cloudflared-bin
pkgver=2022.2.2
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
        "cloudflared-tunnel@.service"
        "sysusers.d")
source_x86_64=("${pkgname}-x86_64-${pkgver}::${_url}/releases/download/${pkgver}/cloudflared-linux-amd64")
source_i686=("${pkgname}-386-${pkgver}::${_url}/releases/download/${pkgver}/cloudflared-linux-386")
source_aarch64=("${pkgname}-aarch64-${pkgver}::${_url}/releases/download/${pkgver}/cloudflared-linux-arm64")
source_armv6h=("${pkgname}-armv6h-${pkgver}::${_url}/releases/download/${pkgver}/cloudflared-linux-arm")
source_armv7h=("${pkgname}-armv7h-${pkgver}::${_url}/releases/download/${pkgver}/cloudflared-linux-arm")
b2sums=('8d7ee43a5aa87a353928fb9a82dd5de5859e65bc92fad20cfa4645e50e563f4112abe92e0b89f30a7f42c69453e2e8aacbffda99b9218431f490cc4169557da7'
        '09ac52a248193706455b141f31da2a44f8f176b15ff062554da2c9a5e1e5a796b7d39890ed4d81e8941cedad24a0d56169251e9cb1df51097a95111165981630'
        '10ecd693cd7b310f69dce1551a0a9299c89fffafcc67c856f340c66f45263daa1a065ab3c82005856b3ee62a85a1c921db177bf99d91db64be12e4ee3114dccc'
        '2916ff952590b1322c84a390da01639f4e2656faa6d72c3f270b21c89a56bd5fb54fd54c6204736d61a0433b46427701de5a641bf68958dd03f551fe18b8bc7f'
        '064c7d7bec9d6f07690297afd5e62747650ac1952359df7499641e1ff96f1fcf5bc7e4843c1371930c0f57ecac548a5348aeb64196a3794bbe35d9ce732baaac'
        '38c9699663b667844e4236a4f33ff156ab0226f2144590d03e968dc73ae1a5be9510d979c408f5ff3205a057120cc54cf740732b36f361616f48dc269ae1a1a1')
b2sums_x86_64=('4bdfa215d9ccad6f06f21981ca511f812ef3878e6fa54fbbc150097094023a9c5d747a8fb6f4858df870e132a09e16d3d427d1e01242985eb2fd7d7b98c9afbb')
b2sums_i686=('8e56738aaf523817c38898245c14a6162dd6b39b314bbb2f694e1de76ccfed5da5d4fcfa70a57de816fe9a33f56d46bb62208508218c6428acb05733655b2540')
b2sums_aarch64=('3e3e32fded6bde558fb4b1cf624f07775ed0c0b0177b89386dbc3fb8615864806cf95af5ecb2edd1e3d7bf56ce8368cf9f03ab27f3524b556e9d308df61da364')
b2sums_armv6h=('f479af20ef7fa16207b1d74fc06be420a49c40acffed47fa8a4f73799c54d3760eb10411674eddefde5e3cfd8301912ad537cd08ff517dd039554469426847ee')
b2sums_armv7h=('f479af20ef7fa16207b1d74fc06be420a49c40acffed47fa8a4f73799c54d3760eb10411674eddefde5e3cfd8301912ad537cd08ff517dd039554469426847ee')

package() {
  # Install License
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  # Install Binary
  install -Dm755 cloudflared-bin-* ${pkgdir}/usr/bin/cloudflared

  # Configuration File
  install -Dm644 cloudflared.yml ${pkgdir}/etc/cloudflared/cloudflared.yml.example
  install -Dm644 -t ${pkgdir}/usr/lib/systemd/system cloudflared{@,-dns,-tunnel@}.service

  # Post install
  install -Dm644 sysusers.d ${pkgdir}/usr/lib/sysusers.d/cloudflared.conf
}

