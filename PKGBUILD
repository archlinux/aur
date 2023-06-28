# Maintainer: Lex Black <autumn-wind@web.de>

_module=vl-convert-python
pkgname=python-vl-convert
pkgver=0.11.1
pkgrel=1
pkgdesc="Convert Vega-Lite chart specifications to SVG, PNG, or Vega"
arch=(x86_64)
url="https://github.com/vega/vl-convert"
license=(BSD)
depends=(python)
makedepends=(python-maturin python-build python-installer python-wheel)
source=(https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module//-/_}-$pkgver.tar.gz
        0001_maturin_version.patch)
sha256sums=('0c7e9b0331fa6d2128a5129e4afcf6bbf2b87e665216f3df242ed5d43c28bcef'
            'a9ea819d9529b53edd09f26f1fd1043f0d47004746eded3cae22ea3f30504b95')


prepare() {
  cd "${_module//-/_}-${pkgver}"
  # Upstream declares a maturin version <1.0
  patch -Np2 -i ${srcdir}/0001_maturin_version.patch
}

build() {
  cd "${_module//-/_}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_module//-/_}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
