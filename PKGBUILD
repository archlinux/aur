# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: hexchain <i@hexchain.org>
pkgname=python-requirements-parser
_name=${pkgname#python-}
pkgver=0.5.0
pkgrel=5
pkgdesc="A Pip requirements file parser."
arch=('any')
url="https://github.com/madpah/requirements-parser"
license=('Apache')
depends=('python-future' 'python-setuptools' 'python-types-setuptools')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        'https://github.com/madpah/requirements-parser/pull/82.patch')
sha256sums=('3336f3a3ae23e06d3f0f88595e4052396e3adf91688787f637e5d2ca1a904069'
            '19351e57470816d95742917efadf9fe2e0dc7224d7f26a76bdb13f3fcfce7019')

prepare() {
  cd "$_name-$pkgver"

  # fix: only install files in package directory
  patch -Np1 -i ../82.patch
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
