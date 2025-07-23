# Maintainer: Felipe Bartelt <fbartelt at ufmg dot br>
pkgname='python-uaibot'
_name=${pkgname#python-}
pkgver=1.2.7
pkgrel=1
pkgdesc="Uaibot, online robotic simulator"
arch=('x86_64')
url="https://github.com/UAIbot/UAIbotPy"
license=('MIT')
depends=(
  'python>=3.10'
  'python-colour>=0.1.5'
  'python-httplib2>=0.20.4'
  'ipython>=7.34'
  'python-matplotlib>=3.10'
  'python-numpy>=1.24'
  'python-quadprog>=0.1.13'
  python-requests
  'python-scipy>=1.10'
)
makedepends=(python-build python-installer python-wheel python-setuptools pybind11 'cmake>=3.5')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('6dca19cb041d82e2bafcbce1acf9912a849ad776dfb13f8a99386649ec2f3426')
options=('!debug')

build() {
    cd $_name-$pkgver
    sed -i '/cmake/d' pyproject.toml # Cmake dependency incorrectly set in pyproject.toml
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
