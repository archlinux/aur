# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Fenner Macrae <fmacrae.dev at gmail dot com>

pkgname=flashfocus
pkgver=2.3.1
pkgrel=1
pkgdesc="Simple Xorg window focus animations for tiling window managers"
url="https://www.github.com/fennerm/flashfocus"
license=('MIT')
arch=('any')
depends=(
	'python-cffi'
	'python-click'
	'python-i3ipc'
	'python-marshmallow'
	'python-xcffib'
	'python-xpybutil'
	'python-yaml')
makedepends=(
	'python-build'
	'python-installer'
	'python-pytest-runner'
	'python-setuptools'
	'python-wheel')
optdepends=(
	'i3-wm: compatible window manager'
	'sway: compatible window manager'
	'bspwm: compatible window manager'
	'awesome: compatible window manager'
	'xmonad: compatible window manager'
	'picom: recommended compositor if using X-based window managers')
# checkdepends=(
# 	'python-pytest'
# 	'python-pytest-cov'
# 	'python-pytest-factoryboy'
# 	'python-pytest-runner'
# 	'python-pytest-lazy-fixture')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c442d5610fa37d5630ae8aff413ee8429bf528fe3428ff185cdb0ba240ac84e3')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

# check() {
# 	cd "$pkgname-$pkgver"
# 	python setup.py pytest
# }

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dvm644 flashfocus.service -t "$pkgdir/usr/lib/systemd/user/"
}
