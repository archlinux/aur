# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=cpass-py-git
_name=cpass
pkgver=0.9.0.r7.ga12742b
pkgrel=1
pkgdesc="An urwid based TUI frontend for pass"
arch=('any')
url="https://github.com/oliverlew/cpass"
license=('MIT')
depends=('pass' 'python-urwid' 'python3')
makedepends=('git' 'python-setuptools')
provides=('cpass')
conflicts=('cpass')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cd "$pkgname"
	python setup.py build
}

package() {
	cd "$pkgname"
	python setup.py install --root "$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
