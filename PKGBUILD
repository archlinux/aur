# Maintainer: Eisuke Kawashima <e DOT kawaschima+archlinux AT gmail DOT com>

_pkgname=typeshed_client
pkgname="python-${_pkgname}"
pkgdesc='Retrieve information from typeshed and other typing stubs'
pkgver=2.14.0
pkgrel=1
url='https://github.com/JelleZijlstra/typeshed_client'
arch=(any)
license=(MIT)
makedepends=(python-build python-installer python-setuptools)
depends=(python python-typing_extensions)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/JelleZijlstra/typeshed_client/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('be97061d50b8a1c88de3ac0d3f190afafca4164b4134ae30e7482fd484aed022e7bac22c22b9d71c97ed1db155ffac2f23ca0049faffd3ff3ecd2aaec47882d5')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}-${pkgver}"
  python -m venv --clear --system-site-packages venv
  ./venv/bin/python -m installer dist/*.whl
  ./venv/bin/python -P tests/test.py
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
