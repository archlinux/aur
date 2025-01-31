# Maintainer: Hao Long <aur@esd.cc>

pkgname=cloudflared-bin
pkgver=2025.1.1
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
b2sums_x86_64=('f6c872f2502e14f72964c7b70b66cac8592f21a49f6bd358b20214305c991ebbf03019c127b964fc2099b36da3ea3324e0bca6d680c245edceee497df0ad4385')
b2sums_i686=('a4a065dd955190bb5fe2495f40a0e1d2ccd860a110fe3ddf9fde0bc75585cba13bb980f7841701f061b8ea63ab404dfe99efa222cd9678d7dc02e6e9da10dbcd')
b2sums_aarch64=('94dc3f5a4cbe4dc80ec19965703a9a6516314cb621858291859d7139697b2b10a1ae15985555758433bf057234a8d5fa2f7a29d6bbd1848dec3c2fe4548e6917')
b2sums_armv6h=('ba8e63e70b6d3f151f873359a35068ecbc3a9126dab1248dd3d9b6144938faa648b208e2f1e2b7e7268b01deabd2700b27dbf7a119c46c80b9d964b7d6332fe1')
b2sums_armv7h=('ba8e63e70b6d3f151f873359a35068ecbc3a9126dab1248dd3d9b6144938faa648b208e2f1e2b7e7268b01deabd2700b27dbf7a119c46c80b9d964b7d6332fe1')

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
