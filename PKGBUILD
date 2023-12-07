# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>
# Maintainer: Matt Armand <marmand68 at gmail dot com>
pkgname=rofi-rbw
pkgver=1.3.0
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
sha256sums=('74ea9bebac4e759be48b661bc9cf734bff8eee9cedea38396064bfd22d12a627')

build() {
	cd ${pkgname//-/_}-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd ${pkgname//-/_}-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
