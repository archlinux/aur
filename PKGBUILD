# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

_pkgname=seafobj
pkgname=python-$_pkgname
pkgver=12.0.14
pkgrel=2
pkgdesc="Python library for accessing seafile data model"
arch=('any')
url="https://github.com/haiwen/seafobj"

license=('Apache')

depends=('python'
         'python-boto3'
         'python-pylibmc'
         'python-redis')

makedepends=('python-build'
             'python-installer'
             'python-wheel'
             'python-setuptools')

source=("${url}/archive/v${pkgver}-server.tar.gz"
        "pyproject.toml")

sha256sums=('b44ce244c193924521d0a1672ed73d7c83f9ca4feb6832e1eb14e8652ab92977'
            '7eef239a792c72598d4f62a8d85666042b4c28c6a4e9de80b4e020c35d17f7a2')

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
