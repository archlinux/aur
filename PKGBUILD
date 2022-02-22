# Maintainer CodeXYZ: zucyoh@gmail.com
# Previous Maintainer: Kisuke <kisuke at kisuke dot cz>

pkgname=jubler
_AppName=Jubler
pkgver=7.0.3
pkgrel=2
pkgdesc='Subtitle editor running on Java'
arch=('any')
url='http://www.jubler.org'
license=('GPL2')
provides=('jubler')
depends=('java-runtime>=17')
optdepends=('mplayer: live video preview for subtitles'
              'aspell')
source=("https://github.com/teras/${_AppName}/releases/download/v${pkgver}/${_AppName}-${pkgver}.x86_64.appimage"
"jubler.desktop")
sha256sums=('8a82d6123f8f9b5d13640bcbf6296da1af31c359e69fa4717d2450c433ba2c04'
            '56f6d1af4d5086231c2f3935d46aaa0293dbba11ecfeaa5f95609a58a9e59056')
noextract=("${_AppName}-${pkgver}.appimage")

package() {
    cd ${srcdir}

    chmod +x ${_AppName}-${pkgver}.x86_64.appimage
    ./${_AppName}-${pkgver}.x86_64.appimage --appimage-extract

    mkdir -p ${pkgdir}/usr/share/java/${pkgname}
    cp -R ${srcdir}/squashfs-root/lib/* ${pkgdir}/usr/share/java/${pkgname}/
    mv ${pkgdir}/usr/share/java/${pkgname}/AppRun.jar ${pkgdir}/usr/share/java/${pkgname}/${_AppName}.jar

    find ${pkgdir}/usr/share/java/${pkgname}/* -type d -exec chmod 755 {} +
    chmod -R 755 ${srcdir}/squashfs-root/usr/
    cp -R ${srcdir}/squashfs-root/usr ${pkgdir}/

    install -D -m644 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
