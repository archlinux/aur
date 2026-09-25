# Maintainer: Phillip Dykman <phil.d324@gmail.com>
_name=keepassxc-browser-api
pkgname=python-$_name
# renovate: datasource=pypi depName=keepassxc-browser-api
pkgver=1.5.0
pkgrel=1
pkgdesc='Python library for the KeePassXC browser extension protocol'
arch=('any')
url="https://github.com/mietzen/$_name"
license=('MIT')
depends=('python' 'python-pynacl')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('1e429818c0aa0ab2a99203eaa625815974894cc24d6ad259330adcfe71abeda0')

build() {
  cd "${_name//-/_}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name//-/_}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
