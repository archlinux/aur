# Maintainer: Benoit <archlinux@benoit.jp.net>
# Contributor: OpenSauce04 <opensauce04@gmail.com>
# Contributor: Yamada Hayao <development@fascode.net>

pkgname="jquake"
pkgver="1.8.5"
pkgrel="3"
pkgdesc="Free software that helps you monitor real-time shaking events in Japan"
arch=('x86_64')
url="https://jquake.net/en/"
license=('Apache')
depends=('java-runtime')
source=("https://fleneindre.github.io/downloads/JQuake_${pkgver}_linux.zip"
        "icon.png"
        "jquake.desktop")
md5sums=('2c42a9dd8d5cb3597e5dcd5986ccf370'
         'ae8c0b172c57f76594e182246ddcdac2'
         'b815ce5958a40757e15add0c42cb015f')
package() {
    local lib
    lib=(
        "JQuake_lib"
        "sounds"
        "JQuake.jar"
    )

    mkdir -p "${pkgdir}/usr/lib/jquake" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/licenses/jquake" "${pkgdir}/usr/share/pixmaps" "${pkgdir}/usr/share/applications"

    # Library
    cp -r ${lib[@]} "${pkgdir}/usr/lib/jquake/"

    # Documents
    cp -r "${srcdir}/LICENSE"* "${pkgdir}/usr/share/licenses/jquake"
    cp -r "${srcdir}/readme.txt" "${pkgdir}/usr/share/licenses/jquake"

    # Icon
    cp "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/jquake.png"
    cp "${srcdir}/jquake.desktop" "${pkgdir}/usr/share/applications"

    echo -e "#!/usr/bin/env bash\njava -jar /usr/lib/jquake/JQuake.jar -Xmx200m -Xms32m -Xmn2m -Djava.net.preferIPv4Stack=true" > "${pkgdir}/usr/bin/jquake"
    chmod 755 "${pkgdir}/usr/bin/jquake"

}
