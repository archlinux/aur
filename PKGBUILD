# Maintainer: mosh5382 <arch@moshermail.com>
pkgname=linapple
_name=_src-
pkgver=2b
pkgrel=1
pkgdesc="An Apple 2, 2e cross-platform emulator "
arch=('x86_64')
url="http://http://linapple.sourceforge.net/index.html"
license=('GPL')
depends=('sdl' 'curl' 'zlib' 'libzip')
makedepends=('imagemagick')
conflicts=('linapple-git')
source=(http://beotiger.com/download/"$pkgname$_name$pkgver")
md5sums=('4f60543ff6e02eb3663182d215203f7c')

build() {

  msg2 "Generate desktop application entry for linapple..."
  cat > "${srcdir}"/${pkgname}.desktop << EOF
[Desktop Entry]
Version=2b
Type=Application
Name=LinApple
Comment=An Apple 2, 2e cross-platform emulator
Exec=linapple %f
Icon=linapple
Terminal=false
Categories=System;
MimeType=application/x-linapple;
Keywords=apple,simulator;
EOF

}
package() {
	mkdir -p $pkgdir/usr/local/
        mkdir -p $pkgdir/usr/local/bin/

	cd "$pkgname$_name$pkgver/src"
	make INSTDIR="$pkgdir/usr/local/$pkgname" STARTUP="$pkgdir/usr/local/bin/$pkgname" install
	
	msg2 "Convert icon to png format..."
	convert "$pkgdir/usr/local/$pkgname/icon.bmp" "$pkgdir/usr/local/$pkgname/$pkgname.png"	

	msg2 "Install desktop application entry in /usr/share/applications..."
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
#	install -Dm644 "$srcdir/$pkgname/usr/local/$pkgname/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 "$pkgdir/usr/local/$pkgname/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
