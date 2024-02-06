# Maintainer: greyltc

pkgname=python-pkg-about
pkgver=1.1.5
pkgrel=1
pkgdesc="Shares Python package metadata at runtime."
url="https://github.com/karpierz/pkg_about"
arch=('x86_64')
license=('ZLIB')
depends=('python>=3.7')
makedepends=(
'python-setuptools>=42.0'
python-build
python-installer
python-wheel
python-tox
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/karpierz/pkg_about/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0c45507ab7098b5d21194cbbf6c17921fb03279ae25564cebd9695d78325cdc7')

build() {
  cd "pkg-about-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "pkg-about-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
