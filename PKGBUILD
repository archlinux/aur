# Maintainer: Bryce <onyxdelta@hotmail.com>
pkgname="trilium-bin"
pkgver=0.43.1
pkgrel=1
pkgdesc="A hierarchical note taking application built on modern technologies."
depends=('python' 'make' 'gconf' 'libxss' 'nss' 'lib32-gcc-libs' 'gtk3')
arch=('x86_64')
url="https://github.com/zadam/trilium"
license=('AGPL')
source=("https://github.com/zadam/trilium/releases/download/v$pkgver/trilium-linux-x64-$pkgver.tar.xz")
sha512sums=('028d72e59f5f12e58cc7fe67fdddff269be5a03e02d5256d3e94e2e09f562543fb50b076365506cdda4221f59f311ec0d6167d6d50ec789496303f325a62b4d4')

package()
{
	export destdir="$pkgdir/"
	#Make folders for extraction
	mkdir -p "$pkgdir/opt/trilium"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/applications"
	#Move main files
	mv trilium-linux-x64/* "$pkgdir/opt/trilium"
	chmod -R 0755 "$pkgdir/opt/trilium"
	#Write command and make executable
	echo -e "#!/bin/sh
/opt/trilium/trilium" > "$pkgdir/usr/bin/trilium"
	chmod +x "$pkgdir/usr/bin/trilium"
	#Create .desktop file
	echo -e "[Desktop Entry]
Name=Trilium
GenericName=Note Taking Application
Comment=A hierarchical note taking application built on modern technologies.
Exec=trilium %f
Icon=/opt/trilium/icon.png
Terminal=false
Type=Application
Categories=Office
StartupWMClass=trilium notes" > "$pkgdir/usr/share/applications/trilium.desktop"
}
