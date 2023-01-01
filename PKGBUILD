# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Serge Victor <arch@random.re>

pkgname=python-addict
_pkg="${pkgname#python-}"
pkgver=2.4.0
pkgrel=5
pkgdesc='Augments dictionaries with attribute syntax'
arch=('any')
url='https://github.com/mewwts/addict'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/a/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('b3b2210e0e067a281f5646c8c5db92e99b7231ea8b0eb5f74dbdf9e259d4e494')

build() {
  cd "$_pkg-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkg-$pkgver"
  python test_addict.py
}

package() {
  cd "$_pkg-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -dv "$pkgdir/usr/share/licenses/$pkgname/"
  ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
