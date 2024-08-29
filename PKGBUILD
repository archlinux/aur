# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="timg"
pkgname="python-${_name}"
pkgver=1.1.6
_commit="9486c7510df7c8de7c99226e62f60909ab5131c9"
pkgrel=1
pkgdesc="Display an image in terminal"
arch=('any')
url="https://github.com/adzierzanowski/${_name}"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
depends=('python' 'python-pillow')
_pkgsrc="${_name}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('b18055144a49db4e6d3b96c7e7101c36feda581b4bca64150d818bedd77b52aa')

build () {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package () {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${pkgdir}${site_packages}/${_name}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
