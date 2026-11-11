# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-lauterbach-trace32-pystart
_name=${pkgname#python-}
pkgver=0.7.0
pkgrel=1
pkgdesc="start Lauterbach TRACE32"
arch=(any)
url="https://pypi.org/project/${_name}"
license=(MIT)
depends=(
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=()
optdepends=()
provides=(${_name})
conflicts=(${_name})
replaces=(${_name})
_name=${_name//-/_}
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('3dbfc6635e6b5eff46dbc2e3cef132cfd7eba5b5f92f13d6b0f99882c99d11d7c04bbb18d0265464bf410b963a252aabe86d15527e6d306bbe712bdc7c5d1e79')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
