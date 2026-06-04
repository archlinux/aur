# Maintainer: Eisuke Kawashima <e DOT kawaschima+arch AT gmail DOT com>

_pkgname=typeshed_client
pkgname="python-${_pkgname}"
pkgdesc='Retrieve information from typeshed and other typing stubs'
pkgver='2.12.0'
pkgrel=1
url='https://github.com/JelleZijlstra/typeshed_client'
arch=(any)
license=(MIT)
makedepends=(python-build python-installer python-setuptools)
depends=(python python-importlib_resources python-typing_extensions)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/JelleZijlstra/typeshed_client/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=(d24a5fc0e35ae035ccb6d5b9228f3945fe5cd46c12329b38b515aba90451bf2ad128608df07020460d9cb8866471f346cc99e3cff27ea566ab26c084fa39c26a)

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}-${pkgver}"
  python tests/test.py
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
