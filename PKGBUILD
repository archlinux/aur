# Maintainer: Hao Long <aur@esd.cc>

pkgname=cloudflared-bin
pkgver=2026.7.2
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
b2sums_x86_64=('5cdd6d772d3053d3799fd518c4a6b9e0c9e11b9e7d9d37e0ec54acfa2de0de0149a08132d4b28e266580b98f9c1c60a63b71039e6bc8cca808c983b47a9294c5')
b2sums_i686=('7a87d423d2cb92c7997dceb6baa0967ef8976dfade158a7fd1ec7003498b097b79b1e5f328c1d500dafcf2733cc534de6a4c3af8c4bd2f9ea20f39a9e34788a0')
b2sums_aarch64=('edb1308c40232e0a29b040388898c45af583abcc6557d29e56cbfcf7c2d30c4a4bd2df5f3f72b42c131a266d592a7bf504308d75ce27e7db6b7d33804297a268')
b2sums_armv6h=('90114f3c80b10a861a64aa5b8cb3a32c41f7984d3e314323fd06cffea6dd5bc388fb2ac3af5c0d27221815aa252da179d53eb31a8e77b90b58c5dd7a81005379')
b2sums_armv7h=('90114f3c80b10a861a64aa5b8cb3a32c41f7984d3e314323fd06cffea6dd5bc388fb2ac3af5c0d27221815aa252da179d53eb31a8e77b90b58c5dd7a81005379')

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
