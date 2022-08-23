# Maintainer: Dan Ginovker <danielginovker@gmail.com>

pkgname=darkan
pkgver=1
pkgrel=1
pkgdesc="Authentic, Open Source 2012 Runescape Era Game"
url="https://darkan.org"
arch=('x86_64')
license=('unknown')
depends=('java-runtime>=17' 'bash')
source=("https://github.com/DarkanRS/client-loader/releases/download/1.0.1/Darkan.jar"
    Darkan.desktop
    Darkan.png)
sha256sums=('2f4a19f6f6b1327cc3d87775ed75f772c21b3841a07dc8875267c606ebb1cdd0'
    '0e0d95bf26fdf362206ad81f9856b94900ea60b54d668b56aa183884a858f58b'
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

