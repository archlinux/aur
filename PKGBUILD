# Contributor: Lex Black <autumn-wind@web.de>

_pkgname=opencloud
pkgname=opencloud-bin
pkgver=5.1.0
pkgrel=1
pkgdesc="secure and private way to store, access, and share your files - upstream built binary"
url="https://github.com/opencloud-eu/opencloud"
arch=('aarch64' 'x86_64')
license=('Apache-2.0')
optdepends=("opencloud-web: if wanting to use a customized web interface")
install="opencloud.install"
conflicts=(opencloud)
provides=(opencloud)
backup=('etc/opencloud/opencloud.env')
source=("opencloud.env"
        "opencloud.service"
        "opencloud.sysusers"
        "opencloud.tmpfiles")
source_x86_64=(${_pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64)
source_aarch64=(${_pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64)
sha512sums=('a8d58020e085b0027bb27226d05d36eb0c1f52c3813f67a3a69cadbbf51bcff8d1a5341057f7a88d0961e3430b1cc9416f4d25e087d1512f3319fd194804c15e'
            'af6b2e80ebaf130fb3e8f6038580bea4db811499d06f2962604941f75d1f8ef0dd3692bf21e54c0611864c49217c8fa457cb6773775a1aa47c7254330f83ba7f'
            '3fa38aba73ffea0e559cf20af9f12b85321a97b41d48aad5c7cea81e9ab7d35c08d7a495c62e6a9fdf6ac7c494a4926805d89171dca0d822d922902188babed3'
            'e4b8c5bfda8214d6493055c996010b385c3be62a861dbcb3564c68aa03851bb6f23cd269f1b869fe4eeec6396ca9943888628c2a46215a7bd3c02c2a8f000742')
sha512sums_aarch64=('e5dc8772622f80160a85612f96d4fcb5370c20b0d023dc9f8d7b2c5d145eaf8640977000047942c5d66aae05b8e10c18b988120bf1b82e200aa6270045952724')
sha512sums_x86_64=('8fe63ebdeb008ebc939090131367dc344bf32459702c1a461fe0400948e6ebc861cb222883c22c835616c1325edd02bd4fe637fb1d05997d401b1828eb531dd4')


package() {
    install -vDm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}-server"

    install -vdm755 "${pkgdir}/etc/${_pkgname}"
    install -vDm644 "${_pkgname}.env" -t "${pkgdir}/etc/${_pkgname}"

    install -vDm644 "${_pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -vDm644 "${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    install -vDm644 "${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
