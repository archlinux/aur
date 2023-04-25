# Maintainer 2021: Nadya <nadyushka228@riseup.net>
# Maintainer 2022-: spyophobia <76800505+spyophobia@users.noreply.github.com>
pkgname=cloak-obfuscation-bin
pkgver=2.7.0
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

sha512sums=('7c38cccacadc98faf13aaddca7c98094eacc7ba0cad816ba7bfdde95e453bf2699a95287ac6d9da6f288fedb6277812979e78c595782cd871e54c753ef501e54')
sha512sums_x86_64=('a824849fc549dd085d114da24c44652eaa598f09ba7a46fa3c9c90c2b31f215e1f53f8e205b3b89d8255621acf077a2d4687dd27468f27cb88a7d68a6038beab'
                   'e3305db8f8152e4f0565ef1c250cae90a74f9a38c5c3ba1361c5a31d01557e7906ffca6343f0ebc0cfce57020211c1e3074c01f59843bad6fbce20488e581b12')
sha512sums_arm=('f1992634776972fd91f66e3e20da033e9bc04240619bfefa93fb23ad4a2deebbebc6364a8df856253e6ce83ad9d525de0f0b7cf88b6066861bd9676047ebb6f3'
                '5395a31abbed3f0ed2f39b3bc6f69006c7e0c6cab6c668817603c65292e525ea4b2a6fbbdc21f195dfa4de99125ff0500bad960d9140dd0e1d233e19f4c005c1')
sha512sums_aarch64=('a934462e692a4bd0aa94274f4bb6073421b8df525c7de73ce61ddf791a793a137e796dac5c38412426a8918ceae313a832a39891c8db1ec39357979dde878a43'
                    '34c9253e9ba6a5b74436018ce67329ea2798b11733e2a9413eb2be499e7fcc9d6343e3750b6c3372266c05a88d28287b3cb71bec3c4ed9fd4e1af3c792474d7c')

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
