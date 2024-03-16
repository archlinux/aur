# Maintainer 2021: Nadya <nadyushka228@riseup.net>
# Maintainer 2022-: spyophobia <76800505+spyophobia@users.noreply.github.com>
pkgname=cloak-obfuscation-bin
pkgver=2.8.0
pkgrel=1
pkgdesc='A pluggable transport that works alongside traditional proxy tools like OpenVPN to evade deep-packet-inspection based censorship (binary version)'
arch=('x86_64' 'arm' 'aarch64')
url='https://github.com/cbeuw/Cloak'
license=('GPL3')
provides=('cloak-obfuscation')
conflicts=("cloak-obfuscation" "cloak-obfuscation-git")
source=("cloak-obfuscation-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
source_x86_64=(
    "${url}/releases/download/v${pkgver}/ck-client-linux-amd64-v${pkgver}"
    "${url}/releases/download/v${pkgver}/ck-server-linux-amd64-v${pkgver}"
)
source_arm=(
    "${url}/releases/download/v${pkgver}/ck-client-linux-arm-v${pkgver}"
    "${url}/releases/download/v${pkgver}/ck-server-linux-arm-v${pkgver}"
)
source_aarch64=(
    "${url}/releases/download/v${pkgver}/ck-client-linux-arm64-v${pkgver}"
    "${url}/releases/download/v${pkgver}/ck-server-linux-arm64-v${pkgver}"
)

sha512sums=('0524f4c64dfc3d1316e4621553b2d326f2b185583291b6aa514269e2091052915673d300921da0ac2cc2d2557e5248e29ffab2ecb8f317fe0537b5aceaad0fe9')
sha512sums_x86_64=('b8bdd76c6fbbdee12b89c4531baa2449f47cc4e743780f9e78c282882a28d007eb934fdc431f8af6c6b3742fe2287d0ce491dc04b4e98cc47ea1038de65d6312'
                   '1a3ad21d40fba7bd2399464afc2ab21779486ad1efdf58df9193e2a5a15afe6c240b5f5b4e6f8af0a9ad58f8e5c9626ce1e032157fbaa1d0ed030d8177df71a0')
sha512sums_arm=('d09d4b534d429b576cc434e4ae5e1051af0433ec0214c869fa66b971f819596583488b0a093e5de4fed59109b9c90f110ef673adcebd4d6ac5ab812c461f37e7'
                'b88c95b5f08530e2a221d660044ad742262a977d3422cc1caf4cc62157f6f2edd890f8376fef69582b8663e0176012caaee50ca0cb759b1dbbeb27e60d89a1cd')
sha512sums_aarch64=('35517d742d632fc915cab1be52b444d8097d6b343fea1b9ef3f372f6d5b44d00ed8caa4ac375c99e104f1f5fb2327181fb896768c6e6896aa35ba015e1467ccd'
                    '607851da9034b89a6644986e77e129e1f4e8041b6b44bfa552b5787f4600255dfe4b3dacb8eb6dc7c2247423acd9408d55a7ed085f91c6a4046c4f9edd7a52b0')

backup=(
    'etc/cloak/ckclient.json'
    'etc/cloak/ckserver.json'
)

package() {
    cd "${srcdir}"
    install -Dm 755 "ck-client-linux-amd64-v${pkgver}" "${pkgdir}/usr/bin/ck-client"
    install -Dm 755 "ck-server-linux-amd64-v${pkgver}" "${pkgdir}/usr/bin/ck-server"

    cd "${srcdir}/Cloak-${pkgver}/example_config"
    install -Dm 644 -t "${pkgdir}/etc/cloak" ckclient.json ckserver.json
}
