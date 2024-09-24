# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="sixelcrop"
pkgname="python-${_name}"
pkgver=0.1.8
pkgrel=1
pkgdesc="Crop sixel images in sixel-space"
arch=('any')
url="https://github.com/joouha/${_name}"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel'
             'python-hatchling')
depends=('python>=3.7')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('215444086225ba34b13d1000c8ee51d792309900795c49aa0cba8eb62d01a976ec1d3281d071e2f9e67a30887945266105eace9b1ceca01a2a2207d8b3659bac')

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
  ln -s "${site_packages}/${_pkgsrc}.dist-info/licenses/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
