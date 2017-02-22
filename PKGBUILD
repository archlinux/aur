# Maintainer: Eloy Garcia Almaden <eloy.garcia.pca@gmail.com>
pkgname=wallpaperdownloader
pkgver=2.6
pkgrel=1
epoch=
pkgdesc="Download, manage and change automatically your favorite wallpapers from the Internet"
arch=('i686' 'x86_64')
url="https://bitbucket.org/eloy_garcia_pca/wallpaperdownloader"
license=('GPL')
groups=()
depends=('java-runtime>=8' 'xdg-utils')
makedepends=('git' 'maven')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('git+https://bitbucket.org/eloy_garcia_pca/wallpaperdownloader.git#branch=master')
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd "$pkgname"
        # Compilation and jar package build
	mvn clean package
}

package() {
	cd "$pkgname"
        # Destination
  	install -dm755 "$pkgdir/opt/$pkgname"
        # Complete jar
	install -Dm644 "$srcdir/$pkgname/target/$pkgname.jar" "$pkgdir/opt/$pkgname/jar/$pkgname.jar"

  	# launcher
  	install -Dm755 "$srcdir/$pkgname/aur/$pkgname.sh" "$pkgdir/usr/bin/$pkgname.sh"

  	# .desktop file and icon
  	install -Dm644 "$srcdir/$pkgname/aur/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "$srcdir/$pkgname/aur/$pkgname.png" "$pkgdir/opt/$pkgname/gui/$pkgname.png"
}
