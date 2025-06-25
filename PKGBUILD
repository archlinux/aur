# Maintainer: taotieren <admin@taotieren.com>

pkgbase=csnet
pkgname=csnet
_tagname=2025-06-25
pkgver=${_tagname//-/.}
pkgrel=16
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
            '5950180f132da5b7471398e203e9eb23f8bab2b3283dcddafffd60863e7a6fb1'
            'f4e0552e29a14ae63045b17a76baeba4cd51af9f80f8d0985b0a5eb8de6bc67d'
            'b212df7856c91c27099e3d57b4a4aa214bdccb7b59719a2c033d1550012f3acd'
            '6f2b2fcc36138372e723d9bf570b4fcb5262ca8ec4534cd88377efb4ecaad53c'
            '47afdfc6f5629e4eadf6cba5827baa84e27fed3b162e99d1008954e0dae98c26')
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
