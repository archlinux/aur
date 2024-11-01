# Maintainer: greyltc

pkgname=python-pkg-about
pkgver=1.2.1
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
sha256sums=('5c2f57a50a3641f3d27c62c77f5b7d556df4a48dcf2ba7b4af0492e88437abdc')

build() {
  cd "pkg-about-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "pkg-about-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
