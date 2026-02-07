# Maintainer: Hao Long <aur@esd.cc>

pkgname=cloudflared-bin
pkgver=2026.2.0
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
b2sums_x86_64=('caaacd7ee618095f1593160bc1354b679f5ddd6ff05ca82256b5e6d6dc46dd80070d70172744530608f46213045eff8a024ff15a0c034eefe3a25fbf985f2528')
b2sums_i686=('f80ab1413942e884996d83feb81acaff6c998ebbde86498bdd311d881cd6b5f22ddf429fe15e5467d35263ac1bcee62844fadc28fd06464d8561d059c6cf994f')
b2sums_aarch64=('1544787fed40753c564702f00845cd137c457ec5686d730546486917b7bf10a7d5313550bb425c947a918ff0cce07edb01c51e851b8e97b678983a90bcfefd07')
b2sums_armv6h=('71f6ac98e7fec498ab681f0521bb9823e68ffac678002af5a124a7793504a95e8f7a6d78f92539c9ebe3e59f7c7db115ad843ed67e179b1077f0db675f4effd3')
b2sums_armv7h=('71f6ac98e7fec498ab681f0521bb9823e68ffac678002af5a124a7793504a95e8f7a6d78f92539c9ebe3e59f7c7db115ad843ed67e179b1077f0db675f4effd3')

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
