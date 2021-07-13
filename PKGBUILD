# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Fenner Macrae <fmacrae.dev at gmail dot com>

pkgname=flashfocus
pkgver=2.2.2
pkgrel=1
pkgdesc="Simple Xorg window focus animations for tiling window managers"
url="https://www.github.com/fennerm/flashfocus"
license=('MIT')
arch=('any')
depends=('python-xcffib'
         'python-click'
         'python-xpybutil'
         'python-marshmallow'
         'python-yaml'
         'python-i3ipc')
makedepends=('python-setuptools' 'python-pip' 'python-wheel')
# checkdepends=('python-pytest')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6be9cfb11370212078f6ddc81222220f2b0ae73dff3b1aaf11410536f0ef27c3')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

# check() {
# 	cd "$pkgname-$pkgver"
# 	python setup.py test
# }

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 flashfocus.service -t "$pkgdir/usr/lib/systemd/user/"
}
