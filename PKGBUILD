# Maintainer: Bryce <onyxdelta@hotmail.com>
pkgname="trilium-bin"
pkgver=0.26.1
pkgrel=1
pkgdesc="A hierarchical note taking application built on modern technologies."
depends=('python' 'make' 'gconf' 'libxss' 'nss' 'lib32-gcc-libs' 'gtk3')
arch=('x86_64')
url="https://github.com/zadam/trilium"
license=('AGPL')
source=("https://github.com/zadam/trilium/releases/download/v$pkgver/trilium-linux-x64-$pkgver.7z")
sha512sums=('7aaf2419a8f58bdc31ed087dcd9f503f3cbfa81b536f13b827bab258e82b3da7aa3a33cb01e307da75985b8787048002e19d6f3d3f5df06b30bdf368948c36c6')

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
Icon=/opt/trilium/resources/app/src/public/images/app-icons/win/icon.ico
Terminal=false
Type=Application
Categories=Office
StartupWMClass=trilium notes" > "$pkgdir/usr/share/applications/trilium.desktop"
}
