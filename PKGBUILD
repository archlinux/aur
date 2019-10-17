# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=teleport
pkgver=4.1.2
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
    '921cfe48055c068fd3a839c0e7ba635290f6e979f629ea39d4a038338c3b755e'
    '0cc7b68844d4926d30f2cee4bb6cec67436a95219cf1ba84954aaa34942229f9'
    '3b26c48a1ade6feea6658a663fe5db7210df24a191816ce95939dc0eddefa0bc'
    )
source_arm=(
    "https://get.gravitational.com/teleport-v${pkgver}-linux-arm-bin.tar.gz"
    "teleport.service"
    "teleport.yaml"
    )
sha256sums_arm=(
    'e8f3418b1736dcb837d09568d1bedd1e2c30d36f3b2b37cd95c7a7722cf60fab'
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

