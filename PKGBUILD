# Maintainer: taotieren <admin@taotieren.com>

pkgbase=csnet
pkgname=csnet
_tagname=2025-03-18
pkgver=${_tagname//-/.}
pkgrel=0
pkgdesc="csnet client for linux"
license=('LicenseRef-scancode-commercial-license')
url="https://aite.xyz/product/csnet/client"
arch=($CARCH)
options=(!strip !debug)
depends=()
makedepends=(libarchive)
provides=(${pkgname} ${pkgname}-bin)
conflicts=(${pkgname} ${pkgname}-bin)
replaces=()
backup=(etc/csnet/config/client_produce.json)
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
sha256sums=('6689bb27bc82e08ea5fd6afffa8a06cdfb343fa3bfc30e280c3379ba70e4d7ca'
            'c94bb7ee617fc06be5d2484e978628cc57ced266048a8a577f72db203d51ebef'
            'e32ce02eb3e8b74f673cc211bc51cebaf4050145cd96b397d9d5079f99eec623'
            'fb15b9072591b3ad0241c6dc72904a772653406df49f426888a2062d5c3b9d12'
            '6b672ef98c36869bb7a753061be9abe5d5551639e38b98039db2d410288c62e5'
            'b6ff625636490d40654c1dda4897aedf990f22d6b01992d8e937e748155ae6b9'
            '2acf5de28a97b5785600e8dd57d104b304d6eadcb43dce21e5a1e808efd4d4df'
            '0bc78d8aa71179f6faa6581cfbad5c2b06f87d82f54f41e1eaca2b11e6719ae0'
            '6a3101dda17a4132d8a1a335ea427951b37c458ba3f1879596bd22d6737c2838')
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
    install -vDm755 ${srcdir}/client_produce.json -t ${pkgdir}/etc/${pkgname}/config/
    install -vdm755 ${pkgdir}/var/log/${pkgname}
    install -vDm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -vDm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    #     install -vDm644 ${srcdir}/LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
