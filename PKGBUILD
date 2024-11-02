# Maintainer: Fabien Devaux <fdev31@gmail.com>
# Contributor: Fabien Devaux <fdev31@gmail.com>
pkgname=wlr-layout-ui
pkgver=1.6.14
pkgrel=1
pkgdesc="GUI to configure your screens"
arch=(any)
url="https://github.com/fdev31/wlr-layout-ui"
license=('MIT')
groups=()
depends=('python' 'python-pyglet' 'python-tomli-w' 'python-tomli')
optdepends=('wlr-randr: To apply the configuration on other wlroots systems'
    'hyprland: To apply the configuration on Hyprland (recommended)',
    'xorg-xrandr: To apply the configuration on X11')
makedepends=('python-build' 'python-installer' 'python-poetry')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
noextract=()
md5sums=('5c3c3329f57ac842193d4abb34167488')

build() {
	cd "$srcdir/${pkgname%-git}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/${pkgname%-git}-${pkgver}"
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 "${srcdir}/wlr-layout-ui-${pkgver}/files/wlr-layout-ui.desktop"\
		"${pkgdir}/usr/share/applications/wlr-layout-ui.desktop"
}
