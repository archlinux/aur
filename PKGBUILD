# Maintainer: Cobalt Space <cobaltspace at protonmail dot com>
# Contributor: William Brown <glowinthedarkcia@horsefucker.org>
pkgname=ftba
pkgver=202206081143_2e021f8e74_release
pkgrel=1
url="https://feed-the-beast.com/app"
arch=(any)
pkgdesc="Offers many different styles of Minecraft modpacks to the community."
source=("https://apps.modpacks.ch/FTBApp/release/${pkgver//_/-}/FTBA_linux_${pkgver//_/-}.deb" "ftbapp.desktop")
sha256sums=('93a7b3311a250fd4f721cfa96d3ea511c86941f3d28748a1a2b616706c6b63bb'
            '72e6e0b01e790e416ab1ac215b7179f968156d10be5b36fad656a4f084778db6')
license=('LGPL2.1')
depends=("java-runtime=8" "java-runtime=11" "java-runtime=17" "avahi") # Crashes without libavahi-common.so.3
optdepends=("jdk8-graalvm-bin: improved performance with '-XX:+UseJVMCICompiler'")

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
