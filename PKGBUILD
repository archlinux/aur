# Maintainer: Bryce <onyxdelta@hotmail.com>
pkgname="trilium-bin"
pkgver=0.25.1
pkgrel=1
pkgdesc="A hierarchical note taking application built on modern technologies."
depends=('python' 'make' 'gconf' 'libxss' 'nss' 'lib32-gcc-libs' 'gtk3')
arch=('x86_64')
url="https://github.com/zadam/trilium"
license=('AGPL')
source=("https://github.com/zadam/trilium/releases/download/v$pkgver-beta/trilium-linux-x64-$pkgver-beta.7z")
sha512sums=('7c7bedd82ca9ec9fe8ccf5cc5c6eab9d8049d45023c15bc79d74f53fefd52e004be36ddd3e5f09d38df44a03538315e0305549ebda5bd547e59f32ee98b21754')

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
