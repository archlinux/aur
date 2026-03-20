# Maintainer: Will Handley <wh260@cam.ac.uk>

pkgname=python-outlines-core
_pkgname=outlines_core
pkgver=0.1.26
pkgrel=1
pkgdesc="Structured Text Generation in Rust"
arch=(x86_64)
url="https://github.com/dottxt-ai/outlines-core"
license=(Apache-2.0)
depends=(
  python
  python-interegular
  python-jsonschema
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-setuptools-rust
  python-wheel
  rust
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('481c4301341e77cc8f1832d616784adb4d461b4fec65878e7c0d2cba7163a189')

build() {
  cd "${_pkgname}-${pkgver}"
  export PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
