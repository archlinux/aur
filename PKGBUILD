# Maintainer 2021: Nadya <nadyushka228@riseup.net>
# Maintainer 2022-: spyophobia <76800505+spyophobia@users.noreply.github.com>
pkgname=cloak-obfuscation-bin
pkgver=2.10.0
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

sha512sums=('f78550d448a0085f0354b8d1c086b7a311941b8f842e7175e9ace5e2a28d2adeb29f484255fa4aabf90ac2320e354b1c6873fb682e301a724fe3eafe8bbe9886')
sha512sums_x86_64=('390f8215abaa11ed7f28290bfb982e130e0c79f30a1128dfe5053064ff2218db289ad20fa81127b796320a5af8f0a165d6af9aa059f55df7b0b1cfe3a72baf4d'
                   '4d35f2c2ea1257ed784fe765376b3738d0fa7d4ed3e064c880da716779d201f191143c1ba855f93e2bc43f7df926644b89a3910921b0d0e3f79ca1a37eaccd92')
sha512sums_arm=('df10369e07331a7abfecd3f2f3a5bb9237c29194c2cd2586ac46dc7dd71c3ce2d2dc2a41a370bc00d8af29edd32229e5fb269337a697f21ecb02da7c98dbe7f9'
                '4d53b2798254539eb80d08323eb52e70f3debc4a1306917fb08e34f60b90bb8f2d7dd6ca141a724f16c53c0b7cc217613aef38b07abb04237cec729cd37a140e')
sha512sums_aarch64=('49d3cefe2af41d7bb226ade2ccccd94ec27d4189ce00467e97ead6373b8c09960fda0c3b5dd6800a612d538c324df66acd28b7a58e9f3430832c05eec70f2d8f'
                    '111dc957f6cd958bf1d9c23098cc4b6098cb6d2a09cf6fca77842397e9329d39d9891d129b95d11843e81fb1755cdf0de4b08aa50ca35696564b788c5bdfe819')

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
