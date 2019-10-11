# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=teleport
pkgver=4.1.1
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
    'ed201e7a84ccfa7d32f77ef5626ed7f1c38bd0f6fd629c787d9c1731177504e3'
    '0cc7b68844d4926d30f2cee4bb6cec67436a95219cf1ba84954aaa34942229f9'
    '3b26c48a1ade6feea6658a663fe5db7210df24a191816ce95939dc0eddefa0bc'
    )
source_arm=(
    "https://get.gravitational.com/teleport-v${pkgver}-linux-arm-bin.tar.gz"
    "teleport.service"
    "teleport.yaml"
    )
sha256sums_arm=(
    'cd4eac1b0b8e7e51c5c1fc2a89f4f7266c7da070438bbe0261c51ba62b2f4163'
    '0cc7b68844d4926d30f2cee4bb6cec67436a95219cf1ba84954aaa34942229f9'
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

