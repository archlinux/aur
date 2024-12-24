# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=opensubtitlescom
pkgname=python-opensubtitles-com
pkgver=0.1.5
pkgrel=2
pkgdesc="A Python wrapper for the OpenSubtitles REST API, providing easy access to subtitle data."
url="https://github.com/dusking/opensubtitles-com"
license=('MIT')
arch=("any")
depends=('python' 'python-requests' 'python-prettytable')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('6fafe2d3e80b865ed8520da8e2878d9520875b7ae5136895a69141199a017e65')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}-${pkgver}"
  python -m installer -d tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages" pytest
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
