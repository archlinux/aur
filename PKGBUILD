# Maintainer: Dan Ginovker <danielginovker@gmail.com>

pkgname=2009scape
pkgver=2.1.3
pkgrel=1
pkgdesc="Authentic, Open Source 2009 Runescape Era Game (Launcher)"
url="https://2009scape.org"
arch=('x86_64')
license=('GPL')
depends=('java-runtime>=8')
source=("https://gitlab.com/2009scape/09launcher/-/jobs/1510765214/artifacts/raw/build/libs/2009scape.jar"
    2009scape.desktop
    2009scape.png)
sha256sums=('276232a73c5d4487f68ee12a44da7b50a4e398d8c2f1527deff5a98bc2b3bd2d'
    'SKIP'
    'SKIP')
noextract=('2009scape.jar')

package() {
    # Copy launcher
    install -D -m644 \
        "${srcdir}/2009scape.jar" \
        "${pkgdir}/usr/share/java/2009scape/2009scape.jar"

    # Desktop Environment integration
    install -D -m644 \
        "${srcdir}/2009scape.desktop" \
        "${pkgdir}/usr/share/applications/2009scape.desktop"

    install -D -m644 \
        "${srcdir}/2009scape.png" \
        "${pkgdir}/usr/share/pixmaps/2009scape.png"

    # Make "2009scape" a command that runs a bash file calling java -jar ..
    install -D -m755 \
        "/dev/null" \
        "${pkgdir}/usr/bin/2009scape"

    echo '#!/bin/sh' > "${pkgdir}/usr/bin/2009scape"
    echo 'exec java -jar /usr/share/java/2009scape/2009scape.jar "$@"' >> "${pkgdir}/usr/bin/2009scape"
}

