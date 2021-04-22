# Maintainer: William Brown <glowinthedarkcia@horsefucker.org>
# Maintainer: Cobalt Space <cobaltspace at protonmail dot com>
pkgname=ftba
pkgver=202104081147_534c2a1ea3_release
pkgrel=1
url="https://www.feed-the-beast.com/"
arch=(any)
pkgdesc="Offers many different styles of Minecraft modpacks to the community."
source=("https://apps.modpacks.ch/FTBApp/release/${pkgver//_/-}/FTBA_linux_${pkgver//_/-}.deb" "ftbapp.desktop")
sha256sums=('2cd1706ab8ccff806e998a6e62c1a979d842e9f8ad0a55cad6debc532dd14360'
            '72e6e0b01e790e416ab1ac215b7179f968156d10be5b36fad656a4f084778db6')
license=("LGPL2")
depends=("java-runtime=8" "java-runtime=11" "avahi") # Crashes without libavahi-common.so.3

package() {
	cd "$pkgdir"
	tar -xzf "$srcdir/data.tar.gz"
	mkdir -p usr/{bin,share/applications}
	cp "$srcdir/ftbapp.desktop" usr/share/applications

	# remove windows and apple specific files
	rm -R opt/FTBA/bin/{ftbapp.app,{,**/}*.{exe,dll}}

	# remove bundled jre, java-runtime=11 is dependency.
	rm -R opt/FTBA/jre

	chmod +x opt/FTBA/bin/ftb-app
	ln -rs ./opt/FTBA/FTBApp ./usr/bin
}
