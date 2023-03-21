# Maintainer: Butui Hu <hot123tea123@gmail.com>

_pkgname=lazy_loader
pkgname=python-lazy-loader
pkgver=0.2
pkgrel=1
pkgdesc='Populate library namespace without incurring immediate import costs'
arch=('any')
url='https://github.com/scientific-python/lazy_loader'
license=('BSD')
depends=(
  python
)
makedepends=(
  python-flit-core
  python-build
  python-wheel
  python-installer
)
checkdepends=(
  python-pytest
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/scientific-python/lazy_loader/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('db3ce32393c0e44201765833c2eee9be27d5473b885fdf5d885d3490b7a577cf0356a8a469c1db7ffc0020a21381366bf6d62f01bf24c3e566461c273d29666d')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}-${pkgver}"
  pytest -v
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rfv ${pkgdir}${site_packages}/${_pkgname}/tests
}
# vim:set ts=2 sw=2 et:
