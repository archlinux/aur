# Contributor: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Dino Krtanjek <krtanjekdino@gmail.com>

pkgname=python-iniparse
_name=${pkgname#python-}
pkgver=0.5
pkgrel=1
pkgdesc="Better INI parser library for Python"
arch=('any')
license=('custom:MIT')
url="https://github.com/candlepin/$pkgname"
depends=('python' 'python-six')
makedepends=('python-setuptools')
checkdepends=('python-tests')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('2054bab923df21107652d009f2373789')

prepare() {
	cd "$_name-$pkgver"

	# Avoid conflict with doc files from python2-iniparse
	sed -e "s|share/doc/$_name-|share/doc/$pkgname-|" \
	    -i setup.py
}

build() {
	cd "$_name-$pkgver"
	python ./setup.py build
}

check() {
	cd "$_name-$pkgver"
	python runtests.py
}

package() {
	cd "$_name-$pkgver"
	python ./setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -m755 -d "$pkgdir/usr/share/licenses/$pkgname/"
	mv "$pkgdir/usr/share/doc/$pkgname-$pkgver/"LICENSE* \
	   "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: set ft=sh ts=4 sw=4 noet:
