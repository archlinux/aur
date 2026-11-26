# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-spsdk-lauterbach
_name=${pkgname#python-}
pkgver=0.5.10
pkgrel=1
pkgdesc="Lauterbach debug probe plugin for SPSDK"
arch=(any)
url="https://pypi.org/project/${_name}"
license=(BSD-3-Clause)
depends=(
  python
  # AUR
  python-lauterbach-trace32-rcl
  python-spsdk
  pyinstaller
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=()
optdepends=()
groups=(spsdk-plugins)
provides=(${_name})
conflicts=(${_name})
replaces=(${_name})
_name=${_name//-/_}
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('b6487766ce75dfcea8c28cabca89debc5742330779aaf20acecd8817afafe2bfc8b59417249a88feeb0ccf36897b3f6512aa5a37d83e3eeaef30356624dca526')

build() {
  cd ${srcdir}/$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
