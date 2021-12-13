# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Fenner Macrae <fmacrae.dev at gmail dot com>

pkgname=flashfocus
pkgver=2.2.4
pkgrel=2
pkgdesc="Simple Xorg window focus animations for tiling window managers"
url="https://www.github.com/fennerm/flashfocus"
license=('MIT')
arch=('any')
depends=(
	'python-cffi'
	'python-xcffib'
	'python-click'
	'python-xpybutil'
	'python-marshmallow'
	'python-yaml'
	'python-i3ipc')
makedepends=('python-setuptools' 'python-pytest-runner')
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
sha256sums=('346efca50020f7a9b96e1658c8355f25d8b5e5bfb496a2a7048940813f5c8c16')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

# check() {
# 	cd "$pkgname-$pkgver"
# 	python setup.py pytest
# }

package() {
	export PYTHONHASHSEED=0
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 flashfocus.service -t "$pkgdir/usr/lib/systemd/user/"
}
