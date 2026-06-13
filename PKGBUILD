# Maintainer: Eisuke Kawashima <e DOT kawaschima+archlinux AT gmail DOT com>

_pkgname=typeshed_client
pkgname="python-${_pkgname}"
pkgdesc='Retrieve information from typeshed and other typing stubs'
pkgver=2.13.0
pkgrel=1
url='https://github.com/JelleZijlstra/typeshed_client'
arch=(any)
license=(MIT)
makedepends=(python-build python-installer python-setuptools)
depends=(python python-typing_extensions)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/JelleZijlstra/typeshed_client/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('7d4cd0c53bad04d6f64cb692a045bb59191b1f842c4941efee79ce1948e83b7182ae2095ff74269ef32dbb6b296e2d1deab1b94a561e97616ac50966181a1a73')

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
