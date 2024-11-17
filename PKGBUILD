# Maintainer: Allan Niles allancoding.dev@gmail.com

pkgname=ascii-battleship
pkgver=1.6
pkgrel=3
pkgdesc="An ASCII Battleship game built in Java that can be played in the terminal."
url="https://github.com/allancoding/ascii-battleship"
license=('Apache-2.0')
depends=('java-runtime')
arch=('any')
source=("https://github.com/allancoding/ascii-battleship/releases/latest/download/Ascii_Battleship.jar")
sha256sums=('960847d1de5199f6e66c1620e3965455376c23bf0c0565038e3c696bc690f59b')
package() {
    install -d "${pkgdir}/usr/share/java/${pkgname}"
    install -Dm644 "${srcdir}/Ascii_Battleship.jar" "${pkgdir}/usr/share/java/${pkgname}/Ascii_Battleship.jar"
    echo "#!/bin/sh" > "${srcdir}/ascii-battleship.sh"
    echo 'if [ "$1" = "-v" ]; then' >> "${srcdir}/ascii-battleship.sh"
    echo "echo 'Version ${pkgver}-${pkgrel}'" >> "${srcdir}/ascii-battleship.sh"
    echo "else" >> "${srcdir}/ascii-battleship.sh"
    echo "java -jar /usr/share/java/${pkgname}/Ascii_Battleship.jar" >> "${srcdir}/ascii-battleship.sh"
    echo "fi" >> "${srcdir}/ascii-battleship.sh"
    chmod +x "${srcdir}/ascii-battleship.sh"
    install -Dm755 "${srcdir}/ascii-battleship.sh" "${pkgdir}/usr/bin/ascii-battleship"
}
