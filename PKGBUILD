# Maintainer: doragasu <doragasu (yawn) hotmail (roll) com>

pkgname=gbcflsh
pkgver=1.1
pkgrel=2
pkgdesc="GameBoy Cart Flasher"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gbcf"
license=('GPL')
groups=()
depends=('qt4')
provides=('gbcflsh')
conflicts=('gbcflsh')
install=("$pkgname.install")
source=(http://downloads.sourceforge.net/gbcf/${pkgname}_${pkgver}_src.tar.gz
        gbcflsh.desktop
		config.patch
		ultraspeed.patch)
md5sums=('a2c6c1e0a9e4c4ba64631e0f66989dfc'
         'd6c39e134228d827d26db6d72fd65e85'
		 'f4674e2030d797d1ec8a9d5603a8e97c'
		 '0fdff2428687a4e9f0eb774a6fbfde4f')

build() {
	# Patch to install config files in /usr/share/gbcf instead of ~/config
	patch -p0 < config.patch
	# Patch to fix build errors and add -ultraspeed (for 1.5 Mbps).
	patch -p0 < ultraspeed.patch
	cd "$srcdir/gbcflsh_1.1_src"

	qmake-qt4
	make
}

package() {
	# Install files
	cd "$srcdir/gbcflsh_1.1_src"
	INSTALL_ROOT="$pkgdir" make install
	# Copy icon and .desktop file
	mkdir -p "$pkgdir/usr/share/pixmaps"
	cp src/icon.xpm "$pkgdir/usr/share/pixmaps/gbcflsh.xpm"
	mkdir -p "$pkgdir/usr/share/applications"
	cp "$srcdir/gbcflsh.desktop" "$pkgdir/usr/share/applications/"
} 
