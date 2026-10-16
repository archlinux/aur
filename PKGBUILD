# Maintainer: Hao Long <aur@esd.cc>

pkgname=cloudflared-bin
pkgver=2026.10.1
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
b2sums_x86_64=('60f207c52520ce70965a4f8c34b0bc4b7acc9180f18b6728a2d504cf76abfc89089619be86a31014ab30f5293e4c1c9b07f44e239aac25ae801c6356c2dfc66e')
b2sums_i686=('3642954ebf74d8a408c65b9e853bd5d31ec03d2c2770c776c9642e53d4e2957d02ef4d1a8b9a8b80d62a575eca634c9b107ed48a3f80d84d3fff996d3bd17cb8')
b2sums_aarch64=('dc658fff5132b88ce340b54776feb0e5fb1bd7189c343e3e495d8929268a065de02ce179b0364ff78d60209f2e7f0216b30f54f1f77b4ecbf35c5f9777d13d61')
b2sums_armv6h=('f58b5d40ab6953fb4de0c91478a4dd683ee0c8df2f1919df2bbcb2e95bc3a9300bed7f7ef0f03459517931200f7699fd814deb2a50a27ec44701f68f84ece34f')
b2sums_armv7h=('f58b5d40ab6953fb4de0c91478a4dd683ee0c8df2f1919df2bbcb2e95bc3a9300bed7f7ef0f03459517931200f7699fd814deb2a50a27ec44701f68f84ece34f')

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
