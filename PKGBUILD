# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-lauterbach
pkgver=0.0.2
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
sha512sums=('b461ea7ee17b921ee620599cca82d375e296665b64d5ea4df413e9fecd04c63731a8f436b5ebdacc043b60cfe09c868559f10b4ea1d60638ddedb47ee7cfea21')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
