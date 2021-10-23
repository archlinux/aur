# Maintainer: Bryce Kabat <brycekabat@onyxazryn.com>
pkgname="trilium-bin"
pkgver=0.48.3
pkgrel=1
pkgdesc="A hierarchical note taking application built on modern technologies."
depends=('libxss' 'nss' 'gtk3')
arch=('x86_64')
url="https://github.com/zadam/trilium"
license=('AGPL3')
source=("https://github.com/zadam/trilium/releases/download/v$pkgver/trilium-linux-x64-$pkgver.tar.xz")
sha512sums=('89c14f38a09fcc7a62e43681725a958085a3625b9bf93e00a22230c7b07545c54028448b9b33f8a52bb75fd07a80df6e9d48281576c174d71843af568ea70479')

package()
{
	export destdir="$pkgdir/"
	# Make folders for extraction
	mkdir -p "$pkgdir/opt/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/applications"
	# Move main files
	mv trilium-linux-x64/* "$pkgdir/opt/$pkgname"
	# Write command and make executable
	echo -e "#!/bin/sh
/opt/$pkgname/trilium" > "$pkgdir/usr/bin/trilium"
	# Create .desktop file
	echo -e "[Desktop Entry]
Name=Trilium
GenericName=Note Taking Application
Comment=A hierarchical note taking application built on modern technologies.
Exec=trilium %f
Icon=/opt/$pkgname/icon.png
Terminal=false
Type=Application
Categories=Office
StartupWMClass=trilium notes" > "$pkgdir/usr/share/applications/trilium-notes.desktop"
	chmod -R 0755 "$pkgdir"
}
