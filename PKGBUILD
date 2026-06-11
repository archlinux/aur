# Maintainer: Antoine Gaudreau Simard <antoineg.simard 'at' gmail.com>
pkgname=python-yakh
pkgver=0.4.1
pkgrel=2
pkgdesc="Yet Another Keypress Handler"
arch=('any')
url="https://github.com/petereon/yakh"
license=('MIT')
depends=(
  'python'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-poetry-core'
)
source=(
  "https://files.pythonhosted.org/packages/d2/77/bbff0a1e6fb03b8cc2cc373a44cfbbb4fd22863c657f8630f4a0f5eb207c/python_yakh-${pkgver}.tar.gz"
)
sha256sums=('da03e800b4f2f5d85344f1668e852687c12dc1a99a03c65cf3dc13a3680da49d')

build() {
  cd "python_yakh-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "python_yakh-${pkgver}"

  # Install Python package
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install license
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
