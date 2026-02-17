# Maintainer: Aseem Athale <athaleaseem@gmail.com>

pkgname=python-weaviate-client
_pkg=weaviate_client
pkgver=4.19.3
pkgrel=1
pkgdesc='A python native client for easy interaction with a Weaviate instance.'
arch=('any')
url='https://github.com/weaviate/weaviate-python-client'
license=('BSD-3-Clause')
depends=('python' 'python-httpx' 'python-validators' 'python-authlib' 'python-pydantic' 'python-grpcio' 'python-protobuf' 'python-deprecation')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-setuptools-scm')
optdepends=('weaviate-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz")
b2sums=('c5ce88964bf47de5f136482151de298f1c3fe21be1b664ea89ff3e4d407790f381c339d37bc0970a3ef7de4680754326795a56c528ad2fb61863de47f9a0c27c')

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
