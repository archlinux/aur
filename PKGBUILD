# Maintainer: <https://aur.archlinux.org/account/zeauw>

_name=scitokens
pkgname=python-${_name}
pkgver=1.8.1
pkgrel=3
pkgdesc="A reference library for generating and using SciTokens. "
arch=('any')
url='https://github.com/scitokens/scitokens'
license=('Apache License 2.0')
depends=('python-pyjwt' 'python-cryptography' 'python-requests')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2d2cbf7b07e23a4cbb030826e09f3f81b5443dad22335906fce8fc09065ef6df')

build() {
    cd ${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_name}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
