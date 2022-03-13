# Maintainer: Hao Long <aur@esd.cc>

pkgname=cloudflared-bin
pkgver=2022.3.1
pkgrel=2
pkgdesc="An Argo Tunnel client which proxies any local webserver through the Cloudflare network"
arch=("x86_64" "i686" "aarch64" "armv6h" "armv7h")
url="https://developers.cloudflare.com/argo-tunnel/"
_url="https://github.com/cloudflare/cloudflared"
license=("custom")
depends=("glibc")
provides=("cloudflared")
conflicts=("cloudflared")
source=("https://raw.githubusercontent.com/cloudflare/cloudflared/${pkgver}/LICENSE"
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
b2sums_x86_64=('89868e986bc3fd1743f8e69e247a9f420935f0cfb16be39098f257501af4d5ec0b3d25b6d9a482dfca474e5858b13b3c4cafe4ec2952ffc2010a4c3fc45c82b2')
b2sums_i686=('16a28db79bdea1f142ae16f55e67e1d2b14c55c2aa04d60cf66bc7a02945658801ad07298e19da5b01df1466b9dad4d2924cd661c64a977c40a1e68ceb8c63e5')
b2sums_aarch64=('e1a37b28d697c0d5a90db557f3aa10c670d83c513a3918707868db10d6907d1fe8036d4ab81f98de8c9933c1d9650028f4b2e734afba319e3d52c95f1aa1e889')
b2sums_armv6h=('f866a9b4aed5b8bb88cc8904e8fb4f5427b2e8794bdb7c59499f8382fabdcd214dc7e43f753f2b62baeda9684bfc3cff8e30aa98ad10692d2e9a934836b668c8')
b2sums_armv7h=('f866a9b4aed5b8bb88cc8904e8fb4f5427b2e8794bdb7c59499f8382fabdcd214dc7e43f753f2b62baeda9684bfc3cff8e30aa98ad10692d2e9a934836b668c8')

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

