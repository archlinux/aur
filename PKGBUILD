# Maintainer: bemxio <bemxiov@protonmail.com>

pkgname="sklauncher-bin"
pkgdesc="Secure and modern Minecraft Launcher"

pkgver=3.1.1
pkgrel=1

arch=(i686 x86_64)

url="https://skmedix.pl"
license=("unknown")

depends=(java-runtime)
makedepends=(unzip gendesk)

provides=(sklauncher)
conflicts=(sklauncher sklauncher-git)

source=("https://skmedix.pl/_data/SKlauncher-${pkgver}.jar" "sklauncher")
md5sums=("30b2b8976783b2d54677d2b27a3298d0" "3207598439df0c86594f3ef52a25cef1")

noextract=("SKlauncher-${pkgver}.jar")

prepare() {
	# extract the JAR file
	unzip -o -d SKlauncher-${pkgver} SKlauncher-${pkgver}.jar

	# get the icon out of the extracted JAR file
	cp -r SKlauncher-${pkgver}/logo.png SKlauncher.png

	# generate a .desktop file
	gendesk -f -n \
		--pkgname SKlauncher \
		--pkgdesc "${pkgdesc}" \
		--exec sklauncher \
		--icon SKlauncher.png \
		--categories "Game;Simulation"
}

package() {
	# copy the launcher .jar file
	install -Dm755 "SKlauncher-${pkgver}.jar" "${pkgdir}/usr/share/java/sklauncher/SKlauncher.jar"

	# copy the executable script
	install -Dm755 sklauncher "${pkgdir}/usr/bin/sklauncher"

	# copy the extracted icon and the generated .desktop file
	install -Dm644 SKlauncher.png "${pkgdir}/usr/share/pixmaps/SKlauncher.png"
	install -Dm644 SKlauncher.desktop "${pkgdir}/usr/share/applications/SKlauncher.desktop"
}