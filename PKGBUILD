# Maintainer: Fabien Devaux <fdev31@gmail.com>
pkgname=wlr-layout-ui
pkgver=2.2.0
pkgrel=1
pkgdesc="GUI to configure your screens"
arch=('any')
url="https://github.com/fdev31/wlr-layout-ui"
license=('MIT')
depends=('python' 'python-pyglet' 'python-tomli' 'python-tomli-w' 'python-jeepney')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-wheel')
optdepends=('wlr-randr: To apply the configuration on other wlroots systems'
            'hyprland: To apply the configuration on Hyprland (recommended)'
            'xorg-xrandr: To apply the configuration on X11')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('bdd8f538823a28044275c6082136a67940e2cb45274532643b4cd60eb93c7e1c')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 "files/$pkgname.desktop" \
		"$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
