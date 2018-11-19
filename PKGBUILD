# Maintainer: Bryce <onyxdelta@hotmail.com>
pkgname="trilium-bin"
pkgver=0.24.2
pkgrel=2
pkgdesc="A hierarchical note taking application built on modern technologies."
depends=('python' 'make' 'gconf' 'libxss' 'nss' 'lib32-gcc-libs' 'gtk3')
arch=('x86_64')
url="https://github.com/zadam/trilium"
license=('AGPL')
source=("https://github.com/zadam/trilium/releases/download/v$pkgver-beta/trilium-linux-x64-$pkgver-beta.7z")
sha512sums=('16355cbcffb9a5bd8f835132c3c3ca55139cc9c8c7515b0d2dbd3e12078a2a1981a36b903f25f7beda6cfcfe0328e6d089b48fe215e939c13a4e297ac5b93899')

package()
{
	export destdir="$pkgdir/"
	#Make folders for extraction
	mkdir -p "$pkgdir/opt/trilium"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/applications"
	#Move main files
	mv trilium-linux-x64/* "$pkgdir/opt/trilium"
	chmod -R 0555 "$pkgdir/opt/trilium"
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
