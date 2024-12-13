# Contributor: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Dino Krtanjek <krtanjekdino@gmail.com>

pkgname=python-iniparse
_name=${pkgname#python-}
pkgver=0.5.1
_pkgver=0.5
pkgrel=1
pkgdesc="Better INI parser library for Python"
arch=('any')
license=('custom:MIT')
url="https://github.com/candlepin/$pkgname"
depends=('python' 'python-six')
makedepends=('python-setuptools')
checkdepends=('python-tests')
source=(
	"https://github.com/candlepin/$pkgname/archive/refs/tags/$pkgver.tar.gz"
)
md5sums=('0646a83586cde2a8289915287ba28f94')

prepare() {
	cd "$pkgname-$pkgver"

	# Avoid conflict with doc files from python2-iniparse
	sed -e "s|share/doc/$_name-|share/doc/$pkgname-|" \
	    -i setup.py
}

build() {
	cd "$pkgname-$pkgver"
	python ./setup.py build
}

check() {
	cd "$pkgname-$pkgver"
	python runtests.py
}

package() {
	cd "$pkgname-$pkgver"
	python ./setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -m755 -d "$pkgdir/usr/share/licenses/$pkgname/"
	mv "$pkgdir/usr/share/doc/$pkgname-$_pkgver/"LICENSE* \
	   "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: set ft=sh ts=4 sw=4 noet:
