pkgname=diit
pkgver=1.5
pkgrel=1
pkgdesc="Digital Invisible Ink Toolkit"
arch=('any')
license=('custom')
url="https://diit.sourceforge.net"
depends=('java-runtime>=8')
makedepends=()
provides=('diit')
conflicts=()
replaces=()
backup=()
options=()
install=
source=("${pkgname}-${pkgver}.jar::https://cytranet.dl.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.jar"
    diit.desktop
)
noextract=("${pkgname}-${pkgver}.jar")
sha256sums=('a5b878b46f840dd1d95b7e4f09ac422ece2d07d74d89eda648dce5a58f41b563'
    '273d4e287a38bd59a9c0d1117625d32963b9c72fc0ca1766880bd5efbdaa635a'
)

package() {
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share/{applications,${pkgname}}
    cd ${srcdir}
    install -m644 ${pkgname}-${pkgver}.jar ${pkgdir}/usr/share/${pkgname}/${pkgname}.jar
    install -m644 diit.desktop ${pkgdir}/usr/share/applications/

    # Creating terminal activation for diit
    echo -e "#!/bin/sh\nexec \$JAVA_HOME/bin/java -jar -xmx512m /usr/share/${pkgname}/${pkgname}.jar \$@" > ${pkgdir}/usr/bin/${pkgname}
    chmod 755 ${pkgdir}/usr/bin/${pkgname}
}
