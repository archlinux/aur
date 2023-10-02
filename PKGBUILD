# Maintainer: Bart Libert <bart plus aur at libert dot email>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Fenner Macrae <fmacrae.dev at gmail dot com>

pkgname=flashfocus
pkgver=2.4.1
pkgrel=1
pkgdesc="Simple focus animations for tiling window managers"
url="https://www.github.com/fennerm/flashfocus"
license=('MIT')
arch=('any')
depends=(
    'bash'
    'python'
	'python-click'
	'python-i3ipc'
	'python-marshmallow'
	'python-xcffib'
	'python-xpybutil'
	'python-yaml')
optdepends=(
	'i3-wm: compatible window manager'
	'sway: compatible window manager'
	'bspwm: compatible window manager'
	'awesome: compatible window manager'
	'xmonad: compatible window manager'
	'picom: recommended compositor if using X-based window managers')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('28ff948aef8d49dfefd532032bdda88e49dbcbba224f63719f6106163b3ebc20')

makedepends=(python-build python-installer python-wheel)

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dvm644 flashfocus.service -t "$pkgdir/usr/lib/systemd/user/"
}
