# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

_pkgname=seafobj
pkgname=python-$_pkgname
pkgver=13.0.19
pkgrel=1
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

sha256sums=('eacb079734dbc571232c7377bf22e129bd4fe32225af0ca49d1e918fbb4c6581'
            '01faa8b5dd8cfaebdeb4e39fe5fadfa5abc9b049004189d992021adfe1129d90')

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
