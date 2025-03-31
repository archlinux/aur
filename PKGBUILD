# Maintainer: taotieren <admin@taotieren.com>

pkgbase=csnet
pkgname=csnet
_tagname=2025-03-31
pkgver=${_tagname//-/.}
pkgrel=1
pkgdesc="CSNet (Computer Science Network) client for linux"
license=('LicenseRef-scancode-commercial-license')
url="https://aite.xyz/product/csnet/client"
arch=($CARCH)
options=(!strip !debug)
depends=()
makedepends=(libarchive)
optdepends=(
    'anyproxy: A transparent proxy written in Golang.'
)
provides=(${pkgname} ${pkgname}-bin)
conflicts=(${pkgname} ${pkgname}-bin)
replaces=()
backup=(etc/csnet/client_produce.json)
install=${pkgname}.install
source=(
    "${pkgname}.service"
    "${pkgname}.tmpfiles"
    "${pkgname}.sysusers"
    "${pkgname}.install"
    "client_produce.json"
    #     "LICENSE.txt"
    "${pkgname}-x86_64-${pkgver}::https://aite.xyz/product/csnet/client/csnet_client_linux_amd64"
    "${pkgname}-aarch64-${pkgver}::https://aite.xyz/product/csnet/client/csnet_client_linux_arm64"
    "${pkgname}-loong64-${pkgver}::https://aite.xyz/product/csnet/client/csnet_client_linux_loong64"
    "${pkgname}-riscv64-${pkgver}::https://aite.xyz/product/csnet/client/csnet_client_linux_riscv64"

)
sha256sums=('99e4dfd7cf1e77a455f94485e51a55d1ba05cbfa48e0e8457a9ae0bad6e50cea'
            'c94bb7ee617fc06be5d2484e978628cc57ced266048a8a577f72db203d51ebef'
            'e32ce02eb3e8b74f673cc211bc51cebaf4050145cd96b397d9d5079f99eec623'
            '3f43a522d49952f4a486cadcedde3b6faad1dbd12723c3a52e31f74b956f51fd'
            '6b672ef98c36869bb7a753061be9abe5d5551639e38b98039db2d410288c62e5'
            'bfa2b59d427b4213e23c74ee06b8a0eecb16c57d11b0b5930faf74e6818f8a2a'
            '4790f843741fd1b499f471e0dcadea2ae8e920c230c6f37c0734638e35ba63c6'
            '3bffe2a019c17c0fab4c9f19b8dbbe8c9a263f06b578a03a6a62c5b799dcf61b'
            '80472cfb72ba45c463b3b1a4e1e7fba1f75535b294024272c646dc6ae346b0c0')
noextract=()

package() {
    if [ "$CARCH" == "aarch64" ]; then
        msg2 "Install for arm64"
        install -vDm755 ${srcdir}/${pkgname}-${CARCH}-${pkgver} ${pkgdir}/usr/bin/${pkgname}
    elif [ "$CARCH" == "x86_64" ]; then
        msg2 "Install for x64"
        install -vDm755 ${srcdir}/${pkgname}-${CARCH}-${pkgver} ${pkgdir}/usr/bin/${pkgname}
    elif [ "$CARCH" == "loong64" ]; then
        msg2 "Install for loong64"
        install -vDm755 ${srcdir}/${pkgname}-${CARCH}-${pkgver} ${pkgdir}/usr/bin/${pkgname}
    elif [ "$CARCH" == "riscv64" ]; then
        msg2 "Install for riscv64"
        install -vDm755 ${srcdir}/${pkgname}-${CARCH}-${pkgver} ${pkgdir}/usr/bin/${pkgname}
    else
        msg2 "Unsupported architectures"
    fi

    install -vDm644 ${srcdir}/${pkgname}.service -t ${pkgdir}/usr/lib/systemd/system/
    install -vDm755 ${srcdir}/client_produce.json -t ${pkgdir}/etc/${pkgname}/
    install -vdm755 ${pkgdir}/var/log/${pkgname}
    install -vDm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -vDm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    #     install -vDm644 ${srcdir}/LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
