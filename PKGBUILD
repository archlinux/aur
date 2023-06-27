# Contributor: Barfin
# Contributor: Johannes Wienke <languitar@semipol.de>
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=elan
pkgver=6.5
pkgrel=1
pkgdesc="video and audio annotation tool"
arch=(any)
url="https://tla.mpi.nl/tools/tla-tools/elan/"
license=('GPL3')
depends=('java-runtime>=9')
makedepends=('maven' 'java-environment>=9')
source=("http://www.mpi.nl/tools/elan/ELAN_$(echo "${pkgver}" | sed 's/\./-/g')_src.zip"
        "elan")
sha256sums=('819cf6004f5de7f0d8c63ae97e636955298f8a738ba6d74d1172ae96efa3284f'
            'c933caffc0daf1655ffb91564d234209205d9f49e0006c432d63a97a16f43363')

build() {
    cd "${pkgname}-${pkgver}"
    mvn package -P !linux -Dmaven.repo.local="${srcdir}/repo"
}

package() {
    cd "${pkgname}-${pkgver}/target"
    install -dm755 "${pkgdir}/usr/share/java/elan"
    install -Dm644 ./*.jar "${pkgdir}/usr/share/java/elan"
    install -Dm644 ./*.jar "${pkgdir}/usr/share/java/elan"
    install -dm755 "${pkgdir}/usr/share/java/elan/lib"
    install -Dm644 lib/*.* "${pkgdir}/usr/share/java/elan/lib"
    install -dm755 "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/elan" "${pkgdir}/usr/bin"
}
