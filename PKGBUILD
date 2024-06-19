# Maintainer: Felipe Bartelt <fbartelt at ufmg dot br>
pkgname='python-uaibot'
_name=${pkgname#python-}
pkgver=0.0.2
pkgrel=1
pkgdesc="A browser-based robotic simulator"
arch=('any')
url="https://uaibot.github.io/"
license=('MIT')
depends=(
  python
  python-numpy
  python-httplib2
  python-cvxopt
  python-pywavefront
  python-numpy-stl
  python-plotly
  python-scipy
  python-colour
  python-setuptools
  python-collada
  ipython
)
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=(2860efb2a099af1498a65d2ec89c46f6fdffdbcabc19879bfae70916204f90c4)

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
