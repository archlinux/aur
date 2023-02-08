# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-buildlog-consultant
_name=${pkgname#python-}
pkgver=0.0.33
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
sha256sums=('f1b9a0f718e2ed55888f3a839032b7f123490fc23f20db7d17cb0167588f8a97')
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
