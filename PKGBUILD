# Maintainer: Matthew Sexton <matthew@asylumtech.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

_pkgname=setoptconf
pkgname=python-setoptconf
pkgver=0.3.0
pkgrel=2
pkgdesc="Library for retrieving program settings from various sources"
arch=('any')
url="https://github.com/jayclassless/setoptconf"
license=('MIT')
depends=('python')
optdepends=('python-pyyaml')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-nose' 'python-coverage')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/s/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('d2ecbd27c0c7d0d53990e2df98d9aad6490df8b75b71c621d8c441d6e91e3161')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  nosetests
}

package() {
  cd "$_pkgname-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl

  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s \
    "$_site/$_pkgname-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
