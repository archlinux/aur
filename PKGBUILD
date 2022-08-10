# Maintainer: su226 <thesu226 at outlook dot com>
# Contributor: alphRomeo323 <alpharomeo323dev at protonmail dot com>
# Contributor: William Brown <glowinthedarkcia at horsefucker dot org>
pkgname=ftba
pkgver=202207271710_0f9644f5fc_release
pkgrel=1
url="https://feed-the-beast.com/app"
arch=(any)
pkgdesc="Offers many different styles of Minecraft modpacks to the community."
source=("https://apps.modpacks.ch/FTBApp/release/${pkgver//_/-}/FTBA_linux_${pkgver//_/-}.deb" "ftbapp.desktop")
sha256sums=('ce87521fedcd0f6ede3f9408a44ac6fe48723d8a2c81105131c3ccdcb1217c32'
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
