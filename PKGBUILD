# Maintainer: Hao Long <aur@esd.cc>

pkgname=cloudflared-bin
pkgver=2022.4.1
pkgrel=1
pkgdesc="An Argo Tunnel client which proxies any local webserver through the Cloudflare network"
arch=("x86_64" "i686" "aarch64" "armv6h" "armv7h")
url="https://developers.cloudflare.com/argo-tunnel/"
_url="https://github.com/cloudflare/cloudflared"
license=("custom")
depends=("glibc")
provides=("cloudflared")
conflicts=("cloudflared")
source=("${pkgname}-LICENSE::https://raw.githubusercontent.com/cloudflare/cloudflared/${pkgver}/LICENSE"
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
b2sums=('dc6395f606b09f8a2fa6e8d28f8436a9b0d2ee7e43b4033542c55eb1bf26e9e6c01fd53770e825b9e996ef15fd2eb77f1e0524d4fc1a3e8bf52d72de3adbd653'
        '09ac52a248193706455b141f31da2a44f8f176b15ff062554da2c9a5e1e5a796b7d39890ed4d81e8941cedad24a0d56169251e9cb1df51097a95111165981630'
        '10ecd693cd7b310f69dce1551a0a9299c89fffafcc67c856f340c66f45263daa1a065ab3c82005856b3ee62a85a1c921db177bf99d91db64be12e4ee3114dccc'
        '2916ff952590b1322c84a390da01639f4e2656faa6d72c3f270b21c89a56bd5fb54fd54c6204736d61a0433b46427701de5a641bf68958dd03f551fe18b8bc7f'
        '064c7d7bec9d6f07690297afd5e62747650ac1952359df7499641e1ff96f1fcf5bc7e4843c1371930c0f57ecac548a5348aeb64196a3794bbe35d9ce732baaac'
        '38c9699663b667844e4236a4f33ff156ab0226f2144590d03e968dc73ae1a5be9510d979c408f5ff3205a057120cc54cf740732b36f361616f48dc269ae1a1a1')
b2sums_x86_64=('4f198fcc9c3bf8819a70701f61e2ee321f206792b12ea2c05bd6b8826f210662b30c1e0b6b61cb8df4e9a514395c3f54b3b7740681bf9b0e6badf33ff9e87b99')
b2sums_i686=('1af67b263c22e0ff95be762b31800a6be3ca70f0b51712ba64c8f8c3dcaed53d7032b26c75e456b9ddd2443cb8cf5d61fbd34f458d9bcb44dc70909eb3a45804')
b2sums_aarch64=('2ebc4e47c46ebd4dbb0f53a399373586b3fcdbf1d44c133120fcf076e0057a51156df2ccbd7f0b81f44d526260b7ff8a6644a72ef162a3eb133c6718841c44bf')
b2sums_armv6h=('bcd5225da471cfb5e7c3c7c399b541e6e4f0c7c1f0ce07bdb7dfc9391493d0280c6c0c10156e4e5776a9bf943601b6331c72a755424f66cd5f11a98bd75d0ea1')
b2sums_armv7h=('bcd5225da471cfb5e7c3c7c399b541e6e4f0c7c1f0ce07bdb7dfc9391493d0280c6c0c10156e4e5776a9bf943601b6331c72a755424f66cd5f11a98bd75d0ea1')

package() {
  # Install License
  install -Dm644 ${pkgname}-LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  # Install Binary
  install -Dm755 ${pkgname}-*-${pkgver} ${pkgdir}/usr/bin/cloudflared

  # Configuration File
  install -Dm644 cloudflared.yml ${pkgdir}/etc/cloudflared/cloudflared.yml.example
  install -Dm644 -t ${pkgdir}/usr/lib/systemd/system cloudflared{@,-dns,-tunnel@}.service

  # Post install
  install -Dm644 sysusers.d ${pkgdir}/usr/lib/sysusers.d/cloudflared.conf
}

