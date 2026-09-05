# Maintainer: Angel Sulev <angel.sulev@gmail.com>
# Why this exists: aur/litellm 1.99.0-1 imports `expression` unconditionally in
# litellm/proxy/_experimental/mcp_server/outbound_credentials/types.py but does not
# declare it. No python-expression existed in core/extra/AUR as of 2026-09-05.

_name=expression
pkgname=python-expression
pkgver=5.7.0
pkgrel=1
pkgdesc="Practical functional programming for Python 3.10+"
arch=('any')
url="https://github.com/cognitedata/Expression"
license=('MIT')
depends=('python' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-wheel')
optdepends=('python-pydantic: pydantic integration (the "pydantic"/"all" extras)')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('4c5ea4247f871b8724ad580911ad73c1550fc653bb669daf2d49e4b645cc4770')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
