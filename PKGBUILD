# Maintainer: Hao Long <aur@esd.cc>

pkgname=cloudflared-bin
pkgver=2022.10.2
pkgrel=1
pkgdesc="Cloudflare Tunnel client (formerly Argo Tunnel)"
arch=("x86_64" "i686" "aarch64" "armv6h" "armv7h")
url="https://github.com/cloudflare/cloudflared"
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
source_x86_64=("${pkgname}-x86_64-${pkgver}::${url}/releases/download/${pkgver}/cloudflared-linux-amd64")
source_i686=("${pkgname}-386-${pkgver}::${url}/releases/download/${pkgver}/cloudflared-linux-386")
source_aarch64=("${pkgname}-aarch64-${pkgver}::${url}/releases/download/${pkgver}/cloudflared-linux-arm64")
source_armv6h=("${pkgname}-armv6h-${pkgver}::${url}/releases/download/${pkgver}/cloudflared-linux-arm")
source_armv7h=("${pkgname}-armv7h-${pkgver}::${url}/releases/download/${pkgver}/cloudflared-linux-arm")
b2sums=('dc6395f606b09f8a2fa6e8d28f8436a9b0d2ee7e43b4033542c55eb1bf26e9e6c01fd53770e825b9e996ef15fd2eb77f1e0524d4fc1a3e8bf52d72de3adbd653'
        '09ac52a248193706455b141f31da2a44f8f176b15ff062554da2c9a5e1e5a796b7d39890ed4d81e8941cedad24a0d56169251e9cb1df51097a95111165981630'
        'c6795bd9493a44ab14139415813b3503d94efdb7c4e5d597033d7374daefeb051fb2a0c3c9698436586911d1dfb1521de1d40139f5990d4c8fadfe8324d079a9'
        '2916ff952590b1322c84a390da01639f4e2656faa6d72c3f270b21c89a56bd5fb54fd54c6204736d61a0433b46427701de5a641bf68958dd03f551fe18b8bc7f'
        '0c0f84587d054531153ee079a55f83070d66b02c05d0d65c56d6272a2e2f6575e3e05ed15f10bce86363b53301c713ca0baf973ec1a258ba739ab73397ab0f38'
        'd0a77662d4383c990c7d1c9687d3e9abe4ff2c501b9d6d006ee8daf4f0d13b6eafd633c17e3ddc2507b238918e3d123a72a2f6cb8b894d150705b3a8bb69a862')
b2sums_x86_64=('6eb012366d77f4cb5cb4e9ef7ed625ac23bfb356692f2143e47ea333b17fb9b87d92f9fbdf361b83aafc0ccbee93d4005baf2ffeaecf3e4ea91e473c06ddd82c')
b2sums_i686=('d9db0ac6930208d8f300a5a75f09f6ee4a3ac3d623cd511faab9fc45874a3cbe99fc635d951caa61e4425cc7dcd3bbd7a855d7cd9438cf9dc76e606a8796e1ec')
b2sums_aarch64=('88e3f792e6679e206c31bb3320b18fd65833ddc900bcc8549b4b6c58495f5a7043a255fb015b8e292dc889e1e5926752f7ea4c1dc17ac92aacc54a77ef0ff3d5')
b2sums_armv6h=('9b9ab554fa9c23a11a6ec9327098ef42d1ed676bc7114ff4ae411ac93f76a610cdceaab1950f82efa2e2e626ae47cdb58af49ee778e1e6bedb053a0cd73bd766')
b2sums_armv7h=('9b9ab554fa9c23a11a6ec9327098ef42d1ed676bc7114ff4ae411ac93f76a610cdceaab1950f82efa2e2e626ae47cdb58af49ee778e1e6bedb053a0cd73bd766')

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
