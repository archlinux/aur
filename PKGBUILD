# Maintainer: greyltc

pkgname=python-pkg-about
pkgver=1.0.8
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
sha256sums=('c48643c4f08cc85f1d15cbddc36a81e97f2563ee218dd19de7eb856899706214')

build() {
  cd "pkg_about-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "pkg_about-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
