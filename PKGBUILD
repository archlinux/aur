# Maintainer: Jarod G. <skid+aur@tuto-craft.com>
# Contributor: leonekmi <me+git@leonekmi.fr>
pkgname=kolossus-launcher
pkgver="170_2"
pkgrel=1
pkgdesc="Kolossus Launcher, to download the latest version of the IFSCL."
arch=(x86_64)
url="https://en.codelyoko.fr/ifscl/"
license=('custom')
groups=()
provides=()
depends=('bash')
optdepends=()
makedepends=('zip' 'unzip')
conflicts=()
replaces=()
backup=()
install="kolossus-launcher.install"
source=(https://ifscl.b-cdn.net/kolossus/Kolossus_${pkgver}_Linux.zip Kolossus-Launcher.desktop install.sh kolossus-launcher.install)
noextract=(Kolossus_${pkgver}_Linux.zip)
md5sums=('aba63d1b4f0a59ccd1a7328152ba7304'
         '2452af4456694c3b2d27470516a1ccc8'
         'f1757af2f0c62598465fcc3a1ccaaa58'
         '6cbd8a292f3700ffe4a1150d607542cc')
 
prepare() {
	mkdir -p "$pkgname-$pkgver"
	cd "$pkgname-$pkgver"
	unzip "$srcdir/Kolossus_${pkgver}_Linux.zip"
}

package() {
	mkdir -p "$pkgdir/opt" "$pkgdir/usr/share/applications"
	find "$pkgname-$pkgver"/* -type f -exec install -Dm 755 "{}" "$pkgdir/opt/Kolossus-Launcher/{}" \;
	mv "$pkgdir/opt/Kolossus-Launcher/$pkgname-$pkgver"/* "$pkgdir/opt/Kolossus-Launcher/"
	rm -r "$pkgdir/opt/Kolossus-Launcher/$pkgname-$pkgver"
	install -m755 "$srcdir/install.sh" "$pkgdir/opt/Kolossus-Launcher"
	install "$srcdir/Kolossus-Launcher.desktop" "$pkgdir/usr/share/applications/"
}
