# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Javier Tiá <javier dot tia at gmail dot com>

pkgname=python-sen
_pkg="${pkgname#python-}"
pkgver=0.6.2
pkgrel=1
pkgdesc='A terminal user interface for Docker'
url='https://github.com/TomasTomecek/sen'
arch=('any')
license=('MIT')
depends=('python-docker-py' 'python-urwid' 'python-urwidtrees')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-flexmock')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/s/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('3895a5a8e1c4d950ee9ddee900e3e9f7019f9bf758724720a4dc543f205bace4')

build() {
  cd "$_pkg-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkg-$pkgver"
  pytest -x --disable-warnings
}

package() {
  cd "$_pkg-$pkgver"
  python -m installer --destdir "$pkgdir" dist/*.whl
  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -dv "$pkgdir/usr/share/licenses/$pkgname/"
  ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
