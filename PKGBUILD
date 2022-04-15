# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-buildlog-consultant
_name=${pkgname#python-}
pkgver=0.0.21
pkgrel=2
pkgdesc="Build log parser and analyser"
arch=('any')
url="https://github.com/jelmer/buildlog-consultant"
license=('GPL2')
depends=('python-debian' 'python-pyaml' 'python-requirements-parser')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"{,.asc})
sha256sums=('21158a8697665457ad5bc90032fab5bbdf8b1d3709b0bd30b0e68c6b825da7f0'
            'SKIP')
validpgpkeys=('DC837EE14A7E37347E87061700806F2BD729A457') # Jelmer Vernooĳ <jelmer@jelmer.uk>

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

check() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
