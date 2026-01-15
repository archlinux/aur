# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

_pkgname=seafobj
pkgname=python-$_pkgname
pkgver=13.0.15
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

sha256sums=('7d74dd82835fc267498ffd3f01285ceeb6ccbd061c7e1306cd1d24020b019982'
            'b37bd9d68e1c5a7cf4e4195a602637c09e54958e0934e31b359071d19bf4c514')

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
