# Maintainer 2021: Nadya <nadyushka228@riseup.net>
# Maintainer 2022-: spyophobia <76800505+spyophobia@users.noreply.github.com>
pkgname=cloak-obfuscation-bin
pkgver=2.6.1
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

sha512sums=('58699b92359f43cd3a250eb7d60a322c69252c631e5018790290172f82dbd6982d74890c5a7f6635ef7f25d421c36291cf0d6fc5ace29363e9220db076fba5e9')
sha512sums_x86_64=('831f4b62de11997438193240d1e133d15e20c845cfe5bdc71048bbfdde0aa2c1833387e9732af6bf12d25bcba3b20f05654f805b149638289ea31362a5f34765'
                   '66631bad734c19817a92be32d7427cda9a04fe4c820ca9e4cd9f70e4efaf558aefea5d2b8a61fe33d141f443e9e51f40950445b564b6a88fd23f9d871ab5a794')
sha512sums_arm=('5910849e3e05d70c974d138a5580ed124f06a279bcb0f3c1721dd5a1b05f633dd22324f99877846c93132ae322f31c1a21f0072337b4de6274a17fe805196b2f'
                '763ecb9e8159a630db0af1e12e115a9b31aa812b0574f36bb297b92368b9bff7b840fc3a4017eb34096ebe4eb7a770bff3a1ec8e606e12a58062b97d87fbff73')
sha512sums_aarch64=('7b87369e12a6336098cfc63823cf4c593f22d3ca15712a575b5a8164225643765231984cba9706f3c2e154e61f3ffe487ece60a876861e28580429d34690e079'
                    '1efd507748ce7af83e7dcdc7557b660ebdaaa0852fda65d2e2ed679d8a9b1edc2024b8e2112349bb23760034c2aae193f1ceeeabba8328d22fdea05684c434cc')

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
