# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Daniel Moch <daniel AT danielmoch DOT com>
# Contributor: gue5t <gue5t@aur.archlinux.org>

_name=Mastodon.py
pkgname=python-mastodon
pkgver=1.8.0
pkgrel=1
pkgdesc="Python bindings for the Mastodon RPC API"
arch=('any')
url="https://github.com/halcy/Mastodon.py"
license=('MIT')
depends=(
  'python-dateutil'
  'python-decorator'
  'python-magic'
  'python-requests'
  'python-six')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('python-cryptography' 'python-halcy-blurhash' 'python-http-ece')
checkdepends=(
  'python-cryptography'
  'python-halcy-blurhash'
  'python-http-ece'
  'python-pytest'
  'python-pytest-cov'
  'python-pytest-mock'
  'python-pytest-runner'
  'python-pytest-vcr'
  'python-pytz'
  'python-requests-mock'
  'python-vcrpy')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/M/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f5af3bb16df6409bed0bb8b97543d7979237a6a2a2a4bc484dec261c36918668')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  pytest -x
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -dv "$pkgdir/usr/share/licenses/$pkgname/"
  ln -sv "$_site/Mastodon.py-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: set sts=2 sw=2 ft=PKGBUILD et:
