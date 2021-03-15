# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=teleport
pkgver=6.0.1
pkgrel=0
pkgdesc="Modern SSH server for teams managing distributed infrastructure"
arch=('x86_64' 'arm' 'armv7h' 'aarch64')
url="https://gravitational.com/teleport"
license=('Apache')
depends=('glibc')
install=teleport.install
source_x86_64=(
    "https://get.gravitational.com/teleport-v${pkgver}-linux-amd64-bin.tar.gz"
    "teleport.service"
    "teleport.yaml"
    )
sha256sums_x86_64=(
    '9fe38a57fd8313c2ce500a9a71168b1d6620fc2fd4d7914a92051a1c27f50d8c'
    'a4e7bb81be841bccedc493824d8740f5addc1d8f4cb483e0883f9650c7369f47'
    'd8463472ba2cfe34c77357bf16c02c0f7a381a7610ede81224ee8d064f908177'
    )
source_arm=(
    "https://get.gravitational.com/teleport-v${pkgver}-linux-arm-bin.tar.gz"
    "teleport.service"
    "teleport.yaml"
    )

sha256sums_arm=(
    'e2a168e160bf4396da6f72dca8abb278ab99c315ab5c200730e92fe85973709b'
    'a4e7bb81be841bccedc493824d8740f5addc1d8f4cb483e0883f9650c7369f47'
    '3b26c48a1ade6feea6658a663fe5db7210df24a191816ce95939dc0eddefa0bc'
    'f5880caa8b48c710c24c5497e7543892e3fc8eae8153ff985f4e9ae57bbcb287'
    )
source_armv7h=("${source_arm[@]}")
sha256sums_armv7h=("${sha256sums_arm[@]}")
source_aarch64=(
    "https://get.gravitational.com/teleport-v${pkgver}-linux-arm64-bin.tar.gz"
    "teleport.service"
    "teleport.yaml"
    )

sha256sums_aarch64=(
    'e2a168e160bf4396da6f72dca8abb278ab99c315ab5c200730e92fe85973709b'
    'a4e7bb81be841bccedc493824d8740f5addc1d8f4cb483e0883f9650c7369f47'
    '3b26c48a1ade6feea6658a663fe5db7210df24a191816ce95939dc0eddefa0bc'
    'd3c98ddbffb219eaa4a89410ced10c7f6a481cc2e326d03a73e4eda3feac6c9c'
    )
options=(!strip)

backup=('etc/teleport/teleport.yaml')

package() {
    mkdir -p "${pkgdir}/usr/lib/systemd/system" "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/etc/teleport"

    install -m644 teleport.yaml "${pkgdir}/etc/teleport/teleport.yaml"

    install -m644 teleport.service "${pkgdir}/usr/lib/systemd/system/teleport.service"

    cd "${srcdir}/teleport"
    install -m755 -t "${pkgdir}/usr/bin/" teleport tctl tsh
    # no man pages, docs or web assets in release tarball
}

