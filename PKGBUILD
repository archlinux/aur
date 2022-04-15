# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-unpackable
_name=${pkgname#python-}
pkgver=0.0.4
pkgrel=2
pkgdesc="Destructure Python objects"
arch=('any')
url="https://github.com/alexdelorenzo/unpackable"
license=('LGPL3')
depends=('python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        'https://raw.githubusercontent.com/alexdelorenzo/unpackable/master/requirements.txt')
sha256sums=('55185896c71f607f43e8cbe22913e46083baf2371ecd1c8a06f0bf93ab76f38d'
            '73af39a5d735313ddb6ca919d601059946074f46cbe9228246b4f2c8270ed6f1')

prepare() {
  cp requirements.txt "$_name-$pkgver"
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
