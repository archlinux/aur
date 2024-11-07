# Maintainer: greyltc

pkgname=python-pkg-about
pkgver=1.2.2
pkgrel=1
pkgdesc="Shares Python package metadata at runtime."
url="https://github.com/karpierz/pkg_about"
arch=('x86_64')
license=('ZLIB')
depends=(
python-docutils
python-tomli
python-setuptools
python-packaging
python-importlib-metadata
)
makedepends=(
python-build
python-installer
python-wheel
python-tox
python-setuptools
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/karpierz/pkg_about/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('89ef63e7d58538a1dd2d42c977f3df9285a8deed1cfa784f049619d499fc6efe')

prepare() {
  cd "pkg_about-${pkgver}"

  # TODO: add these restrictions back in when the packages become available
  sed 's,setuptools>=75.3.0,setuptools,' -i pyproject.toml
  sed 's,tox>=4.23.2,tox,' -i pyproject.toml
}

build() {
  cd "pkg_about-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "pkg_about-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
