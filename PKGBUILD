# Maintainer: Alexis Rossfelder <rossfelderalexis@gmail.com>
pkgname=pomme-launcher-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Launcher for PommeMC, a Minecraft client written in Rust from scratch"
arch=('x86_64')
url="https://github.com/PommeMC/Client"
license=('GPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('pomme-launcher')
conflicts=('pomme-launcher')
options=('!strip')
source=("pomme-launcher-${pkgver}.deb::https://github.com/PommeMC/Client/releases/download/launcher-v${pkgver}/pomme-launcher-linux-x64-gnu.deb")
sha256sums=('955a1718ff143d06bbeb56e22ce7930c005a8ad23cc409061c06097dd9b02a30')
noextract=("pomme-launcher-${pkgver}.deb")

package() {
	bsdtar -xf "$srcdir/pomme-launcher-${pkgver}.deb" -C "$srcdir" data.tar.gz
	bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"

	find "$pkgdir/usr" -type d -exec chmod 755 {} \;
	find "$pkgdir/usr" -type f -exec chmod 644 {} \;
	chmod 755 "$pkgdir/usr/bin/pomme-launcher" "$pkgdir/usr/bin/generate-bindings"

	mv "$pkgdir/usr/share/applications/Pomme Launcher.desktop" "$pkgdir/usr/share/applications/pomme-launcher.desktop"
	sed -i 's/^Categories=$/Categories=Game;/' "$pkgdir/usr/share/applications/pomme-launcher.desktop"
}
