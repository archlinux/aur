# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Ex-Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Brad Ackerman <brad[at]facefault[dot]org>

pkgname=python-msoffcrypto-tool
_pkg="msoffcrypto_tool"
pkgver=5.1.1
pkgrel=1
pkgdesc='A Python tool and library for decrypting encrypted MS Office files'
arch=('any')
url='https://github.com/nolze/msoffcrypto-tool'
license=('MIT')
depends=('python-olefile' 'python-cryptography')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('5585a303fa3ee49eec0253f912be17b82cf83f13f0f7489b4ea10f4ecb285278')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel
}

package() {
	cd "$_pkg-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/${_pkg/-/_}-$pkgver.dist-info/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
