# Maintainer: Kisuke <kisuke at tauren dot cz>
# Previous Maintainer: CodeXYZ: zucyoh@gmail.com
# Previous Maintainer: Kisuke <kisuke at kisuke dot cz>
pkgname=jubler
_AppName=Jubler
pkgver=10.0.0
pkgrel=1
pkgdesc='Subtitle editor running on Java'
arch=('any')
url='http://www.jubler.org'
license=('GPL2')
provides=('jubler')
depends=('java-runtime>=21')
optdepends=('libvlc: live video preview for subtitles'
              'aspell')
source=("https://github.com/teras/${_AppName}/releases/download/v${pkgver}/${_AppName}-${pkgver}-x86_64.appimage"
"jubler.desktop")
sha256sums=('513d9cde8346f2592455eb14b257df98bcf406fefbecb87157acc995f7d54289'
            '83f4399e9aa7439c9cc78636c1777f322aa8c31add764b423d3ed19ba2ecc1df')
noextract=("${_AppName}-${pkgver}-x86_64.appimage")

package() {
    cd ${srcdir}

    chmod +x ${_AppName}-${pkgver}-x86_64.appimage
    ./${_AppName}-${pkgver}-x86_64.appimage --appimage-extract

    mkdir -p ${pkgdir}/usr/share/java/${pkgname}
    cp -R ${srcdir}/squashfs-root/lib/app/* ${pkgdir}/usr/share/java/${pkgname}/
    # mv ${pkgdir}/usr/share/java/${pkgname}/AppRun.jar ${pkgdir}/usr/share/java/${pkgname}/${_AppName}.jar

    find ${pkgdir}/usr/share/java/${pkgname}/* -type d -exec chmod 755 {} +
    # chmod -R 755 ${srcdir}/squashfs-root/usr/
    # cp -R ${srcdir}/squashfs-root/usr ${pkgdir}/
    
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/512x512/apps
    cp ${srcdir}/squashfs-root/jubler.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png

    install -D -m644 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
