# Maintainer: Eisuke Kawashima <e DOT kawaschima+archlinux AT gmail DOT com>

_pkgname=typeshed_client
pkgname="python-${_pkgname}"
pkgdesc='Retrieve information from typeshed and other typing stubs'
pkgver=2.15.0
pkgrel=1
url='https://github.com/JelleZijlstra/typeshed_client'
arch=(any)
license=(MIT)
makedepends=(python-build python-installer python-setuptools)
depends=(python python-typing_extensions)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/JelleZijlstra/typeshed_client/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('684b55ffce7eaefaaaa43ad78807ec701676019b38117d92c2521ae4ff5dfea7487be04f664d4ac62d3a6c64eb997166b4c2bb3900c667a17991d3631d0ffec9')

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
