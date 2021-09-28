# Maintainer: deserts <int8@foxmail.com>
pkgname=gprojector
pkgver=3.0.1
pkgrel=1
pkgdesc="Interactive tool for exploring map projections"
arch=("any")
url="https://www.giss.nasa.gov/tools/gprojector/"
license=("custom")
groups=("nasa-tools")
depends=("java-runtime>=8"
         "hicolor-icon-theme"
         "desktop-file-utils")
makedepends=("unzip")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=gprojector.install
changelog=
source=("https://www.giss.nasa.gov/tools/gprojector/download/G.ProjectorJ-${pkgver}.zip"
        "LICENSES"
        "gprojector-script.patch"
        "gprojector16.png"
        "gprojector32.png"
        "gprojector48.png"
        "gprojector64.png"
        "gprojector128.png"
        "gprojector.desktop")
noextract=()
_sha1="$(curl https://www.giss.nasa.gov/tools/gprojector/download/G.Projector-${pkgver}.sha1.txt 2>/dev/null | grep "G.ProjectorJ.*.zip" | grep -o "^[^ ]*")"
sha1sums=("${_sha1}"
          "01c11fd7393d5043e7444743cbbc343b1904c729"
          "35633c41c1c97ad6b708e2075637590dc5c401d7"
          "d33941fd5b6d9baab4af8a83539a599eff7046b3"
          "02089612edc7e9d1c3f616f6dc6c91df8cf33261"
          "6cbcd85a343a071f5713ac7646f269b88d8f0086"
          "e877f1f2a877fb7e146e32fe8684c61eba1ffd07"
          "52d228bc9e26c66521bf96c3468c22773786aeea"
          "a75de7cd0f4666d11a651fd7121a3a618ac7a875")

prepare() {
    cd ${srcdir}/G.ProjectorJ
    patch -uN -i ../gprojector-script.patch || return 1
    unzip -px jars/G.Projector.jar gov/nasa/giss/projector/about/resources/projector.png > ../gprojector244.png
}

package() {
    install -Dm644 ${srcdir}/LICENSES ${pkgdir}/usr/share/licenses/${pkgname}/LICENSES
    install -d -m755 ${pkgdir}/usr/share/java/gprojector
    install -Dm644 ${srcdir}/G.ProjectorJ/jars/*.jar ${pkgdir}/usr/share/java/gprojector
    install -Dm755 ${srcdir}/G.ProjectorJ/gprojector.sh ${pkgdir}/usr/bin/gprojector
    install -Dm644 ${srcdir}/gprojector16.png ${pkgdir}/usr/share/icons/hicolor/16x16/apps/gprojector.png
    install -Dm644 ${srcdir}/gprojector32.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/gprojector.png
    install -Dm644 ${srcdir}/gprojector48.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/gprojector.png
    install -Dm644 ${srcdir}/gprojector64.png ${pkgdir}/usr/share/icons/hicolor/64x64/apps/gprojector.png
    install -Dm644 ${srcdir}/gprojector128.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/gprojector.png
    install -Dm644 ${srcdir}/gprojector244.png ${pkgdir}/usr/share/icons/hicolor/244x244/apps/gprojector.png
    install -Dm644 ${srcdir}/gprojector.desktop ${pkgdir}/usr/share/applications/gprojector.desktop
}
