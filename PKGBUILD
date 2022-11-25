# Maintainer: Ricahrd Neumann aka. Schard <mail ar richard dash neumann period de>
# Contributor: William Brown <glowinthedarkcia@horsefucker.org>
pkgname="processing-bin"
pkgver="4.0.2"
_build=1287
pkgrel="1"
arch=("x86_64")
pkgdesc="Programming environment for creating images, animations and interactions."
url="https://processing.org/"
source=("https://github.com/processing/processing4/releases/download/processing-${_build}-${pkgver}/processing-${pkgver}-linux-x64.tgz")
sha256sums=('5f9100c21cc27d18ad9fe2b9b68002ce504d4c88af52be2de6923848a9761b3c')
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
