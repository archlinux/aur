# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=spyder-ai-chat
pkgname=python-${_base}
pkgver=1.0.7
pkgrel=1
pkgdesc="OpenAI-compatible AI chat pane + FIM completion for Spyder 6"
url="https://sourceforge.net/projects/spyder-ai-chat-plugin"
arch=(any)
license=(MIT)
depends=(spyder)
makedepends=(python-build python-installer python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base//-/_}/${_base//-/_}-${pkgver}.tar.gz)
sha512sums=('389abe16a1336df47a8640da8069e5faf39444d8edfcdbba43620b1b52885c4bf4748ddcb905b72ae7fe7676b2b528cf27250d4e07a89a01398c6ca6ba10d5c0')

build() {
  cd ${_base//-/_}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base//-/_}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
