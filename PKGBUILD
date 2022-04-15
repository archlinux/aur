# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: peippo <christoph+aur@christophfink.com>

pkgname=python-unicodecsv
_name=${pkgname#python-}
pkgdesc="Drop-in replacement for the csv module that supports unicode strings"
pkgver=0.14.1
pkgrel=4
arch=('any')
license=('BSD')
url="https://github.com/jdunck/python-unicodecsv"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=(
	"$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
	"https://raw.githubusercontent.com/jdunck/python-unicodecsv/master/LICENSE")
sha256sums=('018c08037d48649a0412063ff4eda26eaa81eff1546dbffa51fa5293276ff7fc'
            'a3b3fcd3f2b3e97b4c4ffc354f719e1519dc95dc0b09d82f769538feeb7db032')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
