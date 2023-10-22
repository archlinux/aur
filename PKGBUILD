# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>
# Maintainer: Matt Armand <marmand68 at gmail dot com>
pkgname=rofi-rbw
pkgver=1.2.0
pkgrel=1
license=("MIT")
pkgdesc="Rofi frontend for Bitwarden"
url="https://github.com/fdw/rofi-rbw"
makedepends=("python-build" "python-installer" "python-wheel" "python-poetry")
depends=("python" "rbw" "python-configargparse")
optdepends=("xdotool: for autofill on X11"
			"wtype: for autofill on Wayland")
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/${pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('c54ee58f87762e31c0b3f6184244463861e211e8c971c8f4ff25d296fc1484ac')

build() {
	cd ${pkgname//-/_}-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd ${pkgname//-/_}-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
