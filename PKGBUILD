# Maintainer: Sylvain POULAIN <sylvain.poulain at giscan dot com>
pkgname=python-segment-anything-py
_pkgname=segment-anything
pkgver=1.0.1
pkgrel=3
pkgdesc="An unofficial Python package for Meta AI's Segment Anything Model"
arch=('any')
url="https://github.com/opengeos/segment-anything"
license=('Apache Software License 2.0')
depends=('python' 'python-pytorch' 'python-torchvision' 'python-pycocotools')
makedepends=('git' 'python-setuptools' 'python-build')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('835e798842495d3efc5a7be23b09a2294ee1ce8fa5d8194b3cc2739eac60108a')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
  # rm -r "${pkgdir}${site_packages}/${_base}"/tests/
  # mv "${pkgdir}/usr/etc" "${pkgdir}/etc"
}
