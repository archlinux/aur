pkgname=freedesktop-templates-libreoffice
pkgver=6.3.3
pkgrel=3
pkgdesc='LibreOffice Templates for the “Create New...” menu'
arch=('any')
license=('unknown')
depends=('dolphin' 'libreoffice')
source=("http://ftp.debian.org/debian/pool/main/libr/libreoffice/libreoffice-kde5_${pkgver/_/-}-${pkgrel}_amd64.deb")
sha256sums=('798d6389b87343a69369156e30ec2c7b8afcffae7eb1f5bba06be9359af8d6e4')

prepare() {
	tar xf data.tar.xz
	# metainfo exists in libreoffice
	rm -rf ./usr/{lib,share/{appdata,bug,doc,metainfo}}
	sed -Ei 's/ *(\.{3})/\1/g; /\[de\]/d' ./usr/share/templates/*.desktop
}

package() {
	cp -r "$srcdir/usr" "$pkgdir/"
}
