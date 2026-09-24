# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

_pkgname=seafobj
pkgname=python-$_pkgname
pkgver=13.0.25
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

sha256sums=('a54513bbd8125af1f0064a31968b15bef384f7d1dc2502bb07a1ee93a508de19'
            '79860824052868ffc5fc48749b0a8db0440adab832cf25e26e98dbd8dedd336f')

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
