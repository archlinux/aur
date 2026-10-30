# Maintainer: Hao Long <aur@esd.cc>

pkgname=cloudflared-bin
pkgver=2026.10.6
pkgrel=1
pkgdesc="Cloudflare Tunnel client (formerly Argo Tunnel)"
arch=("x86_64" "i686" "aarch64" "armv6h" "armv7h")
url="https://github.com/cloudflare/cloudflared"
license=("Apache-2.0")
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
b2sums_x86_64=('a895241efb5e6d3a3adf5f57b637ccaf8e12b76dd6166fc5ab1472f5c0934bf8c5614972934201851a7357b6bd80ca965e21aca8bfe3ee34912bd1f5a4b2d091')
b2sums_i686=('c8fd89e81134c8a1e170796a0568d455280f095ab9c07c6e2fe063ab5f6976aa221c88a85c728f0dd228f528ed83725e29376a35511b0c11e74f1c6acf8aaadd')
b2sums_aarch64=('75ff6678c3a792514a1967b234f85b83d9a6ef60d728aafc51cf9f1fbfee6d4582e7456535e8c95e5f00af5875f9b4c275a9b61c9a0c31f458a43a68a3675508')
b2sums_armv6h=('0ee9c2e3a1f9b22f16ed769f702074aa00427d5034bc858ac64157140a653827de63e10add509c599a7184d26578439e83f02cc9a005181919790b2ab50e3180')
b2sums_armv7h=('0ee9c2e3a1f9b22f16ed769f702074aa00427d5034bc858ac64157140a653827de63e10add509c599a7184d26578439e83f02cc9a005181919790b2ab50e3180')

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
