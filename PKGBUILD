# Maintainer: Hao Long <aur@esd.cc>

pkgname=cloudflared-bin
pkgver=2022.3.3
pkgrel=2
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
b2sums_x86_64=('1cc575f433a6c2a36fc28288c224c2eacb18d37c488341a526997761042750465a0bc47244cfe6283f87892a4a8440ab24f3c0f1f94a766932d83ca54ffc85ce')
b2sums_i686=('dc9626583daa4bf9b6cd14b77b5d72a83b290bca896f439753f2ec707a0ad82ca37daf34765a5cf550da29044ee8b97c5a1e5155351961b003191acf0afff3b0')
b2sums_aarch64=('5dca72de54348928d45bde3c36e45eab742eecc085e28da9c0d4e8bcc8efb145ee890c7f373d06e37bae6304118a82302feac2bb3437ee832bbf8fc14e02b1c0')
b2sums_armv6h=('803da708ee1468b89c07b8b58d26ab34ebf6aabfee3269326a8b33112d34ae3eabdbcbd359876dd92e9905546dec6f28c0153a6a189910519f18af19c7d8c44c')
b2sums_armv7h=('803da708ee1468b89c07b8b58d26ab34ebf6aabfee3269326a8b33112d34ae3eabdbcbd359876dd92e9905546dec6f28c0153a6a189910519f18af19c7d8c44c')

package() {
  # Install License
  install -Dm644 ${pkgname}-LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  # Install Binary
  install -Dm755 cloudflared-bin-* ${pkgdir}/usr/bin/cloudflared

  # Configuration File
  install -Dm644 cloudflared.yml ${pkgdir}/etc/cloudflared/cloudflared.yml.example
  install -Dm644 -t ${pkgdir}/usr/lib/systemd/system cloudflared{@,-dns,-tunnel@}.service

  # Post install
  install -Dm644 sysusers.d ${pkgdir}/usr/lib/sysusers.d/cloudflared.conf
}

