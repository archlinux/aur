# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-better-bencode
_pkgname="${pkgname#python-}"
pkgver=0.2.1
pkgrel=2
pkgdesc="Fast, standard compliant Bencode serialization"
arch=('x86_64')
url="https://github.com/kosqx/better-bencode"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
_commit=46bdc09f1b3003b39aa4263e0a052883a5209c2a
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('bec74e73c597a473ae286f9e543b7f03af28676b349472d214569c5885540b07')

build() {
  cd "$_pkgname-$_commit"
  python setup.py build
}

check() {
  cd "$_pkgname-$_commit"
  local _ver="$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')"
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-$_ver" python setup.py pytest
}

package() {
  cd "$_pkgname-$_commit"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 et:
