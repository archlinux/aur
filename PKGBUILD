# Maintainer: Barfin
# Contributor: Johannes Wienke <languitar@semipol.de>
# Contributor: Felix Golatofski <contact@xdfr.de>
pkgname=elan
pkgver=6.2
pkgrel=1
pkgdesc="A video and audio annotation tool"
arch=(any)
url="https://tla.mpi.nl/tools/tla-tools/elan/"
license=('GPL3')
depends=('java-runtime>=9')
makedepends=('maven' 'java-environment>=9')
source=("http://www.mpi.nl/tools/elan/ELAN_$(echo "${pkgver}" | sed 's/\./-/g')_src.zip"
        "elan")
sha256sums=('96e45fb994aa45dc8eb37dbf5c357847de043150d8a986ae303093c630c4cafe'
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
