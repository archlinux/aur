# Maintainer AwesomeHaircut: jesusbalbastro gmail com
# Previous Maintainer: Kisuke <kisuke at kisuke dot cz>

pkgname=jubler
_AppName=Jubler
pkgver=6.0.2
pkgrel=1
pkgdesc='Subtitle editor running on Java'
arch=('any')
url='http://www.jubler.org'
license=('GPL2')
provides=('jubler')
depends=('java-runtime>=8')
optdepends=('mplayer: live video preview for subtitles')
source=("https://astuteinternet.dl.sourceforge.net/project/jubler/Jubler%20Binary%20Releases/${pkgver}/${_AppName}-${pkgver}.appimage"
	'jubler.desktop')
sha256sums=('822dfe7cd171cbee15b88608ee76d6121f1ebe3fc1a9743a3a47eed326e5d45d'
            '56f6d1af4d5086231c2f3935d46aaa0293dbba11ecfeaa5f95609a58a9e59056')
noextract=("${_AppName}-${pkgver}.appimage")

package() {
	cd ${srcdir}
	chmod +x ${_AppName}-${pkgver}.appimage
	./${_AppName}-${pkgver}.appimage --appimage-extract
	mkdir -p ${pkgdir}/usr/share/java/${pkgname}
	cp -R ${srcdir}/squashfs-root/lib/* ${pkgdir}/usr/share/java/${pkgname}/
	mv ${pkgdir}/usr/share/java/${pkgname}/AppRun.jar ${pkgdir}/usr/share/java/${pkgname}/${_AppName}.jar
	find ${pkgdir}/usr/share/java/${pkgname}/* -type d -exec chmod 755 {} +

  chmod -R 755 ${srcdir}/squashfs-root/usr/
	cp -R ${srcdir}/squashfs-root/usr ${pkgdir}/

	install -D -m644 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
