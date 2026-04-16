# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

_pkgname=seafobj
pkgname=python-$_pkgname
pkgver=13.0.20
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

sha256sums=('df8e1af4d2f55efe43c6277510c50bf5b1f6098f4b8d7d3c09f6f62841333451'
            '376185562ff1d94068f7987c4671bf3d5208a07b6de07296c937d5e85544d934')

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
