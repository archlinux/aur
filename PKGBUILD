pkgname=netrautafarmi
pkgver=5
pkgrel=1
pkgdesc=".net client for donut.gq rautafarmi"
arch=("any")
url="https://github.com/kawaiizenbo/netrautafarmi"
license=("MIT")
depends=("mono")
source=("https://github.com/kawaiizenbo/netrautafarmi/archive/refs/tags/$pkgver.tar.gz" "icon2.png")
sha256sums=("5b43790d283fcb29b402a3adff2e5105cb6be2ed3623b993c1c1793fa31140ed" "e5d4cde444f4beca80469a5c3afbf17185b06f99711b6096be37da3505cfaa49")

build() {
	cd "netrautafarmi-$pkgver/netrautafarmi"
	xbuild /p:Configuration=Release "netrautafarmi.csproj"
}

package() {
	mkdir -p "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/128x128/apps"
	mkdir "$pkgdir/opt"
	mv "netrautafarmi-$pkgver/netrautafarmi/bin/Release/netrautafarmi.exe" "$pkgdir/opt"
	echo -e "[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Icon=netrautafarmi
Exec=bash -c \"mono /opt/netrautafarmi.exe\"
Name=netrautafarmi
Comment=.net client for donut.gq rautafarmi
Categories=Network;" > "$pkgdir/usr/share/applications/netrautafarmi.desktop"
	mv "icon2.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/netrautafarmi.png"
}
