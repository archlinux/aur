# Maintainer: Kevin D'souza krypticallusion@gmail.com

pkgname=tlauncherorg
pkgver=2.75
pkgrel=1
epoch=1
pkgdesc='Launcher for Minecraft. Builds from tlauncher.org'
url='https://tlauncher.org'
arch=('any')
license=('GPLv3')
depends=('java-runtime>=8')
base_url="https://tlauncher.org/jar"
launcher_jar="launcher.jar"

pkgver() {
	curl -sLI https://tlauncher.org/jar | grep -Fi content-disposition |grep -Po "\d*[.]\d.*\d"
}

source=(
	"launcher.zip::${base_url}"
	"tlauncher.desktop"
	"tlauncher.svg"
	"tlauncher.sh"
)

sha256sums=(
	"SKIP"
	"SKIP"
	"SKIP"	
	"SKIP"
)


package() {
	## TLAUNCHER JAR 
	install -D -m 0644 "${srcdir}/TLauncher-${pkgver}.jar" "${pkgdir}/opt/tlauncher/launcher.jar"

	## DESKTOP AND SCRIPT
	install -D -m 0644 "${srcdir}/tlauncher.desktop" "${pkgdir}/usr/share/applications/tlauncher.desktop"
	install -D -m 0755 "${srcdir}/tlauncher.sh" "${pkgdir}/usr/bin/tlauncher"

	## ICON
	install -D -m 0644 "${srcdir}/../tlauncher.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/tlauncher.png"
}
