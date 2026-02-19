# Maintainer: Aseem Athale <athaleaseem@gmail.com>

pkgname=python-weaviate-client
_pkg=weaviate_client
pkgver=4.19.4
pkgrel=1
pkgdesc='A python native client for easy interaction with a Weaviate instance.'
arch=('any')
url='https://github.com/weaviate/weaviate-python-client'
license=('BSD-3-Clause')
depends=('python' 'python-httpx' 'python-validators' 'python-authlib' 'python-pydantic' 'python-grpcio' 'python-protobuf' 'python-deprecation')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-setuptools-scm')
optdepends=('weaviate-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz")
b2sums=('639ba28c260b4abb7815f752ca84cef7ae9271d90456579359fa379a13ab19662cf15c63c281ccf445c51598ab975483e9745b00f323df33e008c296d449fda2')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
