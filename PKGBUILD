# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=spyder-ai-chat
pkgname=python-${_base}
pkgver=1.1.5
pkgrel=1
pkgdesc="OpenAI-compatible AI chat pane + FIM completion for Spyder 6"
url="https://sourceforge.net/projects/spyder-ai-chat-plugin"
arch=(any)
license=(MIT)
depends=(spyder)
makedepends=(python-build python-installer python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base//-/_}/${_base//-/_}-${pkgver}.tar.gz)
sha512sums=('99cd0bad4003cfb4e624f764b6ca79d4aaea4440e979a7e3be93137ae728edcd08eaa596cb841cfed026ec5b81a82bc6ad9ad5356e6a7abe572ad7a2d7db5c43')

build() {
  cd ${_base//-/_}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base//-/_}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
