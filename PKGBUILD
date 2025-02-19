# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

_pkgname=seafobj
pkgname=python-$_pkgname
pkgver=12.0.9
pkgrel=2
pkgdesc="Python library for accessing seafile data model"
arch=('any')
url="https://github.com/haiwen/seafobj"
license=('Apache')
depends=('python' 'python-boto3' 'python-redis')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')

source=("${url}/archive/v${pkgver}-server.tar.gz"
        "pyproject.toml")

sha256sums=('be952447d6327af1347fa28199c4cc511bc56703a04991e1bac4c254006d6f90'
            '9d7305b7045cd09d934cacd49cfe030cbda3a0df2ee5d11596e09d20fec68b5e')

prepare() {
  ln -sfT "$srcdir/pyproject.toml" "$srcdir/${_pkgname}-${pkgver}-server/pyproject.toml"
}

build() {
  cd "$srcdir/${_pkgname}-${pkgver}-server"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}-server"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
