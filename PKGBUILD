# Maintainer: nomisge <nomisge @ live . de>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andrew Steinke <rkcf@rkcf.me>
# Contributor: mdraw.gh at gmail dot com

pkgname=python-better-exceptions
pkgver=0.3.3
pkgrel=3
pkgdesc="Pretty and helpful exceptions, automatically"
arch=('any')
url='https://github.com/Qix-/better-exceptions'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/b/better-exceptions/better_exceptions-$pkgver.tar.gz")
sha256sums=('e4e6bc18444d5f04e6e894b10381e5e921d3d544240418162c7db57e9eb3453b')

build() {
	cd "better_exceptions-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "better_exceptions-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/better_exceptions-$pkgver.dist-info/LICENSE.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
