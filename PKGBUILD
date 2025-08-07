# Maintainer: ThePirate42 <aur at thepirate42 dot org>

_name=dol

pkgname=python-${_name}
pkgver=0.3.19
pkgrel=1
pkgdesc="Base builtin tools make and transform data object layers (dols)"
arch=('any')
url="https://github.com/i2mint/${_name}"
license=('MIT')
depends=(python)
makedepends=(python-build python-installer python-setuptools)
source=(${_name}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('faa6d0f1e069b4364214b888df7ad24875465cc26e2f18fe1fd1847a5e0a08a78fba2d3a7c7361c14c9a1c58d1c98c3ae8fe61ce197f75d3f7d2ac9419f8752d')

build(){
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package(){
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${site_packages}/${_name}-${pkgver}.dist-info/licenses/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
