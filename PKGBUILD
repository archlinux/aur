# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=amdgpud-bin
_name=${pkgname%-bin}
pkgver=1.0.1
pkgrel=2
pkgdesc="Fan control service for AMD GPUs"
arch=('x86_64')
url="https://github.com/eraden/amdgpud"
license=('Apache' 'MIT')
depends=('gcc-libs')
provides=("$_name")
conflicts=("$_name")
backup=("etc/$_name/config.toml")
source=("$pkgname-$pkgver::$url/releases/download/$pkgver/amdfand"
        "README-$pkgver.md::https://raw.githubusercontent.com/eraden/amdgpud/$pkgver/README.md"
        "$pkgname-$pkgver.service::https://raw.githubusercontent.com/eraden/amdgpud/$pkgver/amdfand.service"
        'config.toml')
sha256sums=('13ce8fccef964641f7285a13fdc77ef343ca1683930de9ffd7beac829c4c64c3'
            '6e3f24223c2d890f8737bf58615aca663b5e63d311357f7e491af2d375a1e87f'
            '2a98fd66d4a6e2dcf8697f0526f9d64fc4b8caa7e5539c42226b23fceb62ed27'
            '708070794d89e86d307fd17009e0410adf49adc471cfcde0fdec1f217c85f0de')

package() {
	install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/amdfand"
	# install -Dm644 LICENSE.APACHE2.md LICENSE.MIT.md -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "$pkgname-$pkgver.service" "$pkgdir/usr/lib/systemd/system/amdfand.service"
	install -Dm644 config.toml -t "$pkgdir/etc/$_name/"
}
