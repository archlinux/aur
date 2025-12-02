# Maintainer: Aseem Athale <athaleaseem@gmail.com>

pkgname=python-weaviate-client
_pkg=weaviate_client
pkgver=4.18.2
pkgrel=1
pkgdesc='A python native client for easy interaction with a Weaviate instance.'
arch=('any')
url='https://github.com/weaviate/weaviate-python-client'
license=('BSD-3-Clause')
depends=('python' 'python-httpx' 'python-validators' 'python-authlib' 'python-pydantic' 'python-grpcio' 'python-protobuf' 'python-deprecation')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-setuptools-scm')
optdepends=('weaviate-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz")
b2sums=('a29d321e7d9ff78a9fbe0a370620863e452cfa3aff628791baf1b76bf359a4ba7571057e9a9e35178eaed794764ced83a480c8b313bbea789211240df55e28c5')

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
