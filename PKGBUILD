# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: hexchain <i@hexchain.org>
pkgname=python-requirements-parser
_name=${pkgname#python-}
pkgver=0.7.0
pkgrel=1
pkgdesc="A Pip requirements file parser."
arch=('any')
url="https://github.com/madpah/requirements-parser"
license=('Apache-2.0')
depends=('python-future' 'python-setuptools' 'python-types-setuptools')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'https://github.com/madpah/requirements-parser/pull/82.patch')
sha256sums=('ca125bd9cb3b6be550d553dc44f670a0e9ebcb1181231fea0a7a04e60e5a16f6'
            '19351e57470816d95742917efadf9fe2e0dc7224d7f26a76bdb13f3fcfce7019')

prepare() {
  cd "$_name-$pkgver"

  # fix: only install files in package directory
  patch -Np1 -i ../82.patch
}

build() {
  cd "$_name-$pkgver"
  GIT_DIR='.' python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
