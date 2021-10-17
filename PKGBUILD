# Maintainer: Dan Ginovker <danielginovker@gmail.com>

pkgname=darkan
pkgver=1
pkgrel=1
pkgdesc="Authentic, Open Source 2012 Runescape Era Game"
url="https://darkan.org"
arch=('x86_64')
license=('unknown')
depends=('java-runtime>=8' 'bash')
source=("https://darkan.org/assets/uploads/files/Darkan.jar"
    Darkan.desktop
    Darkan.png)
sha256sums=('97030d81757c7b8a797cc1de543a8138ebb89b703baa1f94ea850d89a193ea1a'
    '1df8e4e54c0a4218d5cba6e2cc2f281b614fb5f59cab3fe3691113024182b5cc'
    'dbea124d36be28026b313b9300c172f78db0f9d3dbb91e98e0b5bd48a7486fe6')
noextract=('Darkan.jar')

package() {
    # Copy launcher
    install -D -m644 \
        "${srcdir}/Darkan.jar" \
        "${pkgdir}/usr/share/java/Darkan/Darkan.jar"

    # Desktop Environment integration
    install -D -m644 \
        "${srcdir}/Darkan.desktop" \
        "${pkgdir}/usr/share/applications/Darkan.desktop"

    install -D -m644 \
        "${srcdir}/Darkan.png" \
        "${pkgdir}/usr/share/pixmaps/Darkan.png"

    # Make "Darkan" a command that runs a bash file calling java -jar ..
    install -D -m755 \
        "/dev/null" \
        "${pkgdir}/usr/bin/darkan"

    echo '#!/bin/sh' > "${pkgdir}/usr/bin/darkan"
    echo 'exec java -jar /usr/share/java/Darkan/Darkan.jar "$@"' >> "${pkgdir}/usr/bin/darkan"
}

