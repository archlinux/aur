# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=valveresourceformat
pkgver=9.2
pkgrel=1
pkgdesc="Valve's Source 2 resource file format parser, decompiler, and exporter."
arch=('x86_64')
url="https://github.com/ValveResourceFormat/ValveResourceFormat"
license=('MIT')
depends=('glibc' 'gcc-libs' 'zlib')
makedepends=('dotnet-sdk')
options=(!strip !debug)
install=$pkgname.install
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')


build() {
	cd "$srcdir/$pkgname/Decompiler"
	dotnet publish -r linux-x64
}

package() {
	cd "$srcdir/$pkgname/Decompiler/bin/Release/linux-x64/publish"
	for file in {Decompiler,libSkiaSharp.so};
	do
		install -Dm755 $file "$pkgdir/usr/lib/$pkgname/$file"
	done

	mkdir -p "$pkgdir/usr/bin/"
	ln -s /usr/lib/$pkgname/Decompiler "$pkgdir/usr/bin/$pkgname-decompiler"
}
