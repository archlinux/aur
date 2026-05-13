# Maintainer: Sylvain POULAIN <sylvain.poulain at giscan dot com>
pkgname=python-py3dtiles
_pkgname=py3dtiles
pkgver=12.1.1
pkgrel=1
pkgdesc="Python module to manage 3DTiles format"
arch=('any')
url="https://gitlab.com/$_pkgname/$_pkgname"
license=('Apache 2.0')
depends=('python-earcut' 'python-lz4' 'python-numba' 'python-numpy' 'python-pyproj' 'python-pyzmq' 'python-pygltflib' 'python-laspy' 'python-plyfile' 'python-psycopg2' 'python-psutil')
makedepends=('git' 'python-setuptools')
source=("$_pkgname-v$pkgver.tar.gz::$url/-/archive/v$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('009c92cca4feb28bebb545c1378b2ebe25db14938149521eedfa06226feb8e53')

build() {
  cd "$srcdir/$_pkgname-v$pkgver-a18d850251331499395cd56acc4ef321b7227493"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-v$pkgver-a18d850251331499395cd56acc4ef321b7227493"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${_pkgname}"
  # rm -r "${pkgdir}${site_packages}/${_base}"/tests/
  # mv "${pkgdir}/usr/etc" "${pkgdir}/etc"
}
