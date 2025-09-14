# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-lauterbach
pkgver=0.0.3
pkgrel=1
pkgdesc="Python Lauterbach Automation"
arch=(any)
url="https://pypi.org/project/${_name}"
license=(MIT)
depends=(
  python
  python-loguru
  # AUR
  python-lauterbach-trace32-rcl
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=()
optdepends=()
provides=(${_name})
conflicts=(${_name})
replaces=(${_name})
_name=${pkgname//-/_}
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('10354869ce9e93556d7b5f0c62f6c5c3d8fac96838b461555509aeb7ac03f1b0584861c8e92d33e8853b559832c199d40335b74a9277879c8620f21baefcc82d')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
