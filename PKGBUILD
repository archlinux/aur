# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aseem Athale <athaleaseem@gmail.com>

pkgname=python-weaviate-client
pkgver=4.21.3
pkgrel=1
_commit=3a8d341
pkgdesc='A python native client for easy interaction with a Weaviate instance.'
arch=('any')
url='https://github.com/weaviate/weaviate-python-client'
license=('BSD-3-Clause')
depends=('python-httpx' 'python-validators' 'python-authlib' 'python-pydantic' 'python-grpcio' 'python-protobuf' 'python-deprecation')
optdepends=('weaviate')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-setuptools-scm')
source=("$pkgname::git+$url#commit=${_commit}?signed")
sha256sums=('958a763d23b9f886352aa389fb08e7111ff94a1dd89d5af1b6e6eb3a0ee43b5a')
validpgpkeys=('968479A1AFF927E37D1A566BB5690EEEBB952194')

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s "$_site/weaviate_client-$pkgver.dist-info/licenses/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
