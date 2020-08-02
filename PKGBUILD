# Maintainer: William Brown <glowinthedarkcia@horsefucker.org>
pkgname="processing-bin"
pkgver="3.5.4"
pkgrel="4"
arch=("x86_64")
pkgdesc="Programming environment for creating images, animations and interactions."
url="https://processing.org/"
source=("https://download.processing.org/processing-$pkgver-linux64.tgz")
md5sums=("2746cbe158425396dcf8a4103b93400f")
options=("!strip")
install="$pkgname.install"
license=("GPL" "LGPL")
prepare() {
	cd "$srcdir/processing-$pkgver"
	# These scripts install the .desktop file to the home dir.
	# This is not needed and takes space.
	rm install.sh uninstall.sh
	# Normally, install.sh would handle the creation of the .desktop file, but that
	# would install to a home dir rather than to root. The following 3 lines will do.
	cp lib/desktop.template processing.desktop
	sed -ie "s,<BINARY_LOCATION>,/opt/processing/processing," "$srcdir/processing-$pkgver/processing.desktop"
	sed -ie "s,<ICON_NAME>,processing," "$srcdir/processing-$pkgver/processing.desktop"
}
package() {
	# Copying to /opt, all symlinking is done in the processing-bin.install script.
	mkdir -p "$pkgdir/opt"
	cp -R "processing-$pkgver" "$pkgdir/opt/processing"
}
