# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=teleport
pkgver=4.2.2
pkgrel=1
pkgdesc="Modern SSH server for teams managing distributed infrastructure"
arch=('x86_64' 'arm')
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
    '4364742ea40c724b52d749c43e6d875c6783ea66ca7ff0eac5c906571b01f398'
    'a4e7bb81be841bccedc493824d8740f5addc1d8f4cb483e0883f9650c7369f47'
    '3b26c48a1ade6feea6658a663fe5db7210df24a191816ce95939dc0eddefa0bc'
    )
source_arm=(
    "https://get.gravitational.com/teleport-v${pkgver}-linux-arm-bin.tar.gz"
    "teleport.service"
    "teleport.yaml"
    )

sha256sums_arm=(
    'd7926fb2b251f2842b50a31ab88da96906e010a43fd857e5f74507db199ff740'
    'a4e7bb81be841bccedc493824d8740f5addc1d8f4cb483e0883f9650c7369f47'
    '3b26c48a1ade6feea6658a663fe5db7210df24a191816ce95939dc0eddefa0bc'
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
