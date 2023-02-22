# Maintainer: Laura Demkowicz-Duffy <dev@demkowiczduffy.co.uk>
pkgname=openrocket-beta-bin
_pkgname=openrocket
pkgver=22.02
pkgrel=1
pkgdesc="A free and fully featured rocket flight simulator - 6 degrees of freedom, prerelease"
arch=('x86_64')
url="https://openrocket.info/"
license=('GPL3')
depends=('java-runtime=11' 'desktop-file-utils')
provides=(openrocket)
conflicts=(openrocket)
source=("https://github.com/$_pkgname/$_pkgname/releases/download/release-$pkgver/OpenRocket-$pkgver.jar"
	"$_pkgname.sh"
	"de_debian.tar.gz")
noextract=("OpenRocket-$pkgver.jar")
sha256sums=('1e26b83abb6d846e63bcc560f6bf16afe9c370378b614c0aacbfc6ece4ae07c8'
            '74ab605cb11161784d4af96d018eb88adf7a2e4a8b1088a64b94b1e8ec5e18d1'
            '62c4e739f82fa53fdae8a41f12bfb2828b77df89c8f48b1a790192a8e773cb98')

package() {
	cd "$srcdir"
	install -Dm0755 "OpenRocket-$pkgver.jar" "$pkgdir/usr/share/java/$_pkgname/$_pkgname.jar"
	install -Dm0755 "$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"

	install -Dm644 de_debian/$_pkgname.1 $pkgdir/usr/share/man/man1/$_pkgname.1
	find "$pkgdir/usr/share/man/man1" -name *.1 -exec gzip -9 {} +

	install -Dm644 de_debian/$_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
	install -Dm644 de_debian/$_pkgname.xpm $pkgdir/usr/share/pixmaps/$_pkgname.xpm
}
