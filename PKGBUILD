# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-buildlog-consultant
_name=${pkgname#python-}
pkgver=0.0.32
pkgrel=1
pkgdesc="Build log parser and analyser"
arch=('any')
url="https://github.com/jelmer/buildlog-consultant"
license=('GPL2')
depends=('python-debian' 'python-pyaml' 'python-requirements-parser')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
optdepends=('python-openai')
source=("$_name-$pkgver.tar.gz::https://github.com/jelmer/buildlog-consultant/archive/refs/tags/v$pkgver.tar.gz")
#source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6a5a18737b053aa16f450e2662bde899f2e88486e87f20ca6d35fde518a1b545')
#validpgpkeys=('DC837EE14A7E37347E87061700806F2BD729A457') # Jelmer Vernooĳ <jelmer@jelmer.uk>

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
