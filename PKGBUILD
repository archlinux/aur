# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Brad Ackerman <brad[at]facefault[dot]org>

pkgname=python-msoffcrypto-tool
_pkg="msoffcrypto_tool"
pkgver=5.0.1
pkgrel=1
pkgdesc='A Python tool and library for decrypting encrypted MS Office files'
arch=('any')
url='https://github.com/nolze/msoffcrypto-tool'
license=('MIT')
depends=('python-olefile' 'python-cryptography')
makedepends=('python-poetry-core' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('9efd0ef5cc3e086e2d175e7a5d7b2b8cb59836c896b8a486d362bbca166db645')

build() {
	cd "$_pkg-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --skip-build
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/${_pkg/-/_}-$pkgver.dist-info/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
