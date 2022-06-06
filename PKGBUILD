# Maintainer 2021: Nadya <nadyushka228@riseup.net>
# Maintainer 2022-: spyophobia <76800505+spyophobia@users.noreply.github.com>
pkgname=cloak-obfuscation-bin
pkgver=2.5.2
pkgrel=1
pkgdesc='A pluggable transport that works alongside traditional proxy tools like OpenVPN to evade deep-packet-inspection based censorship'
arch=('x86_64')
url='https://github.com/cbeuw/Cloak'
license=('GPL3')
conflicts=("cloak-obfuscation" "cloak-obfuscation-git")
source=(
    "${url}/releases/download/v${pkgver}/ck-client-linux-amd64-v${pkgver}"
    "${url}/releases/download/v${pkgver}/ck-server-linux-amd64-v${pkgver}"
    "${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=(
    90aee78dff01f64cec81429d00f771f0ee39923690364b674a84cb728dcc59c8
    a5b137280eccadd5cfb0132b783477ede6096741855d5fd6ced8ea42727f7fd1
    3397c389d2917b0df6f733a96a7ff82babe14963398ba109e9cf60b19be30ee1
)
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
