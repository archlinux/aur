# Maintainer: Hao Long <aur@esd.cc>

pkgname=cloudflared-bin
pkgver=2022.1.2
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
        "cloudflared-tunnel@.service"
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
        '064c7d7bec9d6f07690297afd5e62747650ac1952359df7499641e1ff96f1fcf5bc7e4843c1371930c0f57ecac548a5348aeb64196a3794bbe35d9ce732baaac'
        '38c9699663b667844e4236a4f33ff156ab0226f2144590d03e968dc73ae1a5be9510d979c408f5ff3205a057120cc54cf740732b36f361616f48dc269ae1a1a1')
b2sums_x86_64=('520ea9cff78020bd03198fc7e6980cb86b2848feefb801428b12e08d90f106bdaa635db52acec9a0be3422242fc358b6606ca16fa277852b56cec5b5c2ee10fd')
b2sums_i686=('2987abe6699fad24f8e571eff2271c55e031fd7d5e17ddf70f970e8474a53b2fa38d6ccd9d918428e01e30ba1dbd9cbc1af6192d8a618ec8f10b378f29e1ee1f')
b2sums_aarch64=('2006982de85626533898c1426ebdef17d8e828070695665d66f9ae1f07400794849257045435905876c4758999728e6f205dcab68405280e06f932b5bb99f098')
b2sums_armv6h=('fbf0fb8868e4cd519ca7532d9aa852f30a43e01e16b0cc429bf44aeaca635d934c83650005d6ff96c442252d782568a4d70e4bebf7968cdd040c8b9722fd7f83')
b2sums_armv7h=('fbf0fb8868e4cd519ca7532d9aa852f30a43e01e16b0cc429bf44aeaca635d934c83650005d6ff96c442252d782568a4d70e4bebf7968cdd040c8b9722fd7f83')

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
