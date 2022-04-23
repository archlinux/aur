# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=omegaide
pkgver=2.2
pkgrel=1
pkgdesc="The Blazing Fast Java IDE and the Instant IDE for any programming language."
arch=("x86_64")
url="http://omegaui.github.io/omegaide"
depends=('java-environment')
makedepends=('imagemagick')
license=('GPL3')
source=('omegaide' 'omegaide.desktop' "https://github.com/omegaui/omegaide/releases/download/v$pkgver-stable/Omega.IDE.jar")
sha256sums=('97ea7c5d9f88871214b5edfafc6d3e1df29b3eb850722488c5e27d04ec0d2a7c'
            'f1eeb0416924e5d0b7c9ed7e07ba0c360946351f7e3e7f9baedf99aaccd351ed'
            '98ebc4fc7ea2281d2ff15175f73ba85639fa434965581e108e1c35e294787db6')

prepare() {
	for i in 16 22 24 32 48 64 128 256 512 ; do
		convert -resize ${i}x$i omega_ide_icon500.png omega_ide_icon$i.png
	done
}

package() {
	install -Dm644 Omega.IDE.jar "$pkgdir"/usr/share/java/$pkgname/$pkgname.jar
	install -Dm775 $pkgname "$pkgdir"/usr/bin/$pkgname
	install -Dm775 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
	for i in 16 22 24 32 48 64 128 256 512 ; do
		install -Dm644 omega_ide_icon$i.png \
		"$pkgdir"/usr/share/icons/hicolor/${i}x$i/apps/omegaide.png
	done
}
