# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-skill-security-scan
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=1.0.0
pkgrel=1
pkgdesc="🔍 Security Scanning Tool for Claude Skills - Protect Your Development Environment"
arch=(any)
license=('MIT')
url="https://pypi.org/project/skill-security-scan"
depends=(
  'python'
  'python-click'
  'python-polib'
  'python-yaml'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
#checkdepends=()
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b927e9d6c435e6452a7b8772fdeac797ae16ada903c8a5bdbc3a2860679bab73')

build() {
  cd ${_name}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
