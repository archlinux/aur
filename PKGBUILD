# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.

# Maintainer: FlawCra <moritz.fuessel@flawcra.cc>
pkgname=chronocraft
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="Unofficial ChronoCraft installer"
arch=('any')
url="https://chronocraftgame.com"
license=('unknown')
groups=()
depends=('libnet' 'gtk3' 'gtk2' 'at-spi2-core' 'java-runtime' 'ffmpeg4.4')
makedepends=('p7zip')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='.INSTALL'
changelog=
source=("https://dtlod8orn734n.cloudfront.net/ChronoCraft.exe"
        "https://download.bell-sw.com/java/8u352+8/bellsoft-jre8u352+8-linux-amd64-full.tar.gz"
		"chronocraft.png"
		"chronocraft.desktop")
noextract=()
md5sums=("SKIP"
		 "8a9822dc330e310937773377121cc7aa"
		 "222d6c1a0fd15fd810848fc8fdb1ebb2"
		 "936f0e48084ea908a5f3830aa5079d15")
validpgpkeys=()

package() {
	7z x $srcdir/ChronoCraft.exe -y -o$srcdir/tmp
	rm -rf $srcdir/tmp/bin/java/* $srcdir/tmp/\$PLUGINSDIR $srcdir/tmp/ChronoCraft.ico $srcdir/tmp/ChronoCraft.bat
	mv $srcdir/jre*-full/* $srcdir/tmp/bin/java/
	chmod +x $srcdir/tmp/bin/java/bin/java
	cat <<EOT >> $srcdir/tmp/chronocraft
#!/bin/sh
cd bin
java/bin/java -jar ProjectXY.jar
EOT
	chmod +x $srcdir/tmp/chronocraft
	mkdir -p $pkgdir/usr/share/chronocraft
	mv $srcdir/tmp/* $pkgdir/usr/share/chronocraft
	chmod -R 777 $pkgdir/usr/share/chronocraft
	install -D -m644 "$srcdir/chronocraft.desktop" "$pkgdir/usr/share/applications/chronocraft.desktop"
	install -D -m644 "$srcdir/chronocraft.png" "$pkgdir/usr/share/pixmaps/chronocraft.png"
}
