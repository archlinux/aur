# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=nodemcu-pyflasher
pkgver=4.0
_pkgdate=20200606
pkgrel=1
pkgdesc="Self-contained NodeMCU flasher with GUI based on esptool.py and wxPython."
arch=("x86_64")
url="https://github.com/marcelstoer/nodemcu-pyflasher"
license=('MIT')
depends=('pyinstaller'
		 'python-wxpython'
		 'esptool')
source=("${pkgname}.tar.gz::https://github.com/marcelstoer/${pkgname}/archive/v${pkgver}.tar.gz"
		"remove-create-dmg.patch")
sha256sums=('728dcad6264bce7a4dddfdd627a95557e0e779ed6bd48d9773766eb6b9af4790'
            '260d5e1f6aa887680dfd0d00d248ecac70d7251f511049e0f0c745447b009975')
prepare() {
	cd "$pkgname-$pkgver"
	patch --forward --strip=1 --input="$srcdir/remove-create-dmg.patch"
}
build() {
	cd "$pkgname-$pkgver"
	./build.sh
}
package() {
	cd "$pkgname-$pkgver"
	install -Dm755 dist/NodeMCU-PyFlasher ${pkgdir}/usr/bin/NodeMCU-PyFlasher
}
