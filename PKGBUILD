# Maintainer: Nixuge

pkgname=minecraft-world-downloader-bin
pkgver=1.18.1
pkgrel=2
pkgdesc='Download Minecraft worlds, extend servers render distance. 1.12.2 - 1.20.1'
url=https://github.com/mircokroon/minecraft-world-downloader
arch=(any)
license=(GPL3)
depends=('java-runtime>=17')
provides=('minecraft-world-downloader')
conflicts=('minecraft-world-downloader')
options=(!strip)
# Note: jar gets extracted, if anyone knows of a way for it NOT to do that send a comment
source=("https://github.com/mircokroon/minecraft-world-downloader/releases/download/v${pkgver}/world-downloader.jar" "https://raw.githubusercontent.com/mircokroon/minecraft-world-downloader/master/src/main/resources/ui/icon/icon.png" "minecraft-world-downloader.desktop" "minecraft-world-downloader")
sha256sums=('5ada3b75b1c9c83d576f1b1a1b79a41f144c9b509c3e049adff8d89d01dc668b' '04c7491d1093ecbb6bea7c42c2b682ae973a7d67cc1029e45e2f9a043220ee91' '36f5fac4ae8021b4f22e3aea1e2459a2973fb04bdb710bfd0a8040722050c2b3' 'ce7be17404b73f38d1a719c98caa75611db25b666c31cded2cf58e8afbe6aa27')


package() {
	# Create folders
	install -dm755 "${pkgdir}/usr/bin/"
    install -dm755 "${pkgdir}/usr/share/java/minecraft-world-downloader"
    install -dm755 "${pkgdir}/usr/share/icons"
    install -dm755 "${pkgdir}/usr/share/applications"

	# move the jar
	install -Dm755 \
		"${srcdir}/world-downloader.jar" \
		"${pkgdir}/usr/share/java/minecraft-world-downloader/"
    
    # move the desktop file
	install -Dm755 \
		"${srcdir}/minecraft-world-downloader.desktop" \
		"${pkgdir}/usr/share/applications/"

    # move the icon, not sure if i should move it to a subfolder as it's a weird res (352x350)
	install -Dm755 \
		"${srcdir}/icon.png" \
		"${pkgdir}/usr/share/icons/minecraft-world-downloader.png"
    
    # move the launcher file
    install -Dm755 \
		"${srcdir}/minecraft-world-downloader" \
		"${pkgdir}/usr/bin/"
}
