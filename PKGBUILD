# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Johannes Wienke <languitar@semipol.de>

pkgname=elan
pkgver=6.1
pkgrel=1
pkgdesc="A video and audio annotation tool"
arch=(any)
url="https://tla.mpi.nl/tools/tla-tools/elan/"
license=('GPL3')
depends=('java-runtime>=9')
makedepends=('maven' 'java-environment>=9')
source=("http://www.mpi.nl/tools/elan/ELAN_$(echo "${pkgver}" | sed 's/\./-/g')_src.zip"
        "elan")
sha256sums=('4e1da751d201db69c44bc665b46ed6a54205e30771f03b364c1ac571c66a17c2'
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
