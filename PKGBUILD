# Maintainer: Sylvain POULAIN <sylvain.poulain at giscan dot com>
pkgname=python-pyodm
_pkgname=pyodm
pkgver=1.5.11
pkgrel=1
pkgdesc="A Python SDK for adding aerial image processing capabilities to your applications. NodeODM"
arch=('any')
url="https://github.com/OpenDroneMap/PyODM"
license=('BSD')
depends=('python-requests' 'python-requests-toolbelt' 'python-urllib3')
makedepends=('git' 'python-setuptools')
#source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
source=("$_pkgname-$pkgver.tar.gz::$url/archive/a01b7f8710e1182f4db04c4d507b333dc3dd9e53.tar.gz")
sha256sums=('9670b8ad36ef6c5f8fc22172d1eb21839d914fad115ff9997f5a2679a25a5469')

build() {
  #cd "$srcdir/$_pkgname-$pkgver"
  cd "$srcdir/PyODM-a01b7f8710e1182f4db04c4d507b333dc3dd9e53"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  #cd "$srcdir/$_pkgname-$pkgver"
  cd "$srcdir/PyODM-a01b7f8710e1182f4db04c4d507b333dc3dd9e53"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
  # rm -r "${pkgdir}${site_packages}/${_base}"/tests/
  # mv "${pkgdir}/usr/etc" "${pkgdir}/etc"
}
