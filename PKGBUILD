# Maintainer: mib <mib@kanp.ai>
pkgname=lightburn-bin
pkgver=1.3.01
pkgrel=2
pkgdesc="A layout, editing, and control software for lasercutters."
arch=('x86_64')
url="https://lightburnsoftware.com"
license=('unknown')
depends=('qt5-multimedia' 'qt5-serialport')
makedepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
source=('lightburn.desktop' "https://github.com/LightBurnSoftware/deployment/releases/download/$pkgver/LightBurn-Linux64-v$pkgver.7z")
sha256sums=('f72e86774d4396240b46e07e947edf9cdf5f8d526a70129c447fed7c173c4867'
            '93adbc22fdb5af901c7b8d8982797ebf18cbc3dfb2e1c72a42aa0699bdcce18f')

package() {
	# bin
	mkdir -p "$pkgdir/usr/share/lightburn"
	cp -r "$srcdir/LightBurn"/* "$pkgdir/usr/share/lightburn"

	# symlink
	mkdir -p "$pkgdir/usr/bin"
    ln -s "$pkgdir/usr/share/lightburn/LightBurn" "$pkgdir/usr/bin/lightburn"

    # desktop entry & icon
    install -Dm 644 "lightburn.desktop" "$pkgdir/usr/share/applications/lightburn.desktop"
    install -Dm 755 "$srcdir/LightBurn/LightBurn.png" "$pkgdir/usr/share/pixmaps/lightburn.png"
}
