# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="sixelcrop"
pkgname="python-${_name}"
pkgver=0.1.7
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
sha256sums=('81a3a2e990d1bc8a8b244e73d73f166d3d0329172d9f22cadf7176783cc781c7')

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
  ln -s "${pkgdir}${site_packages}/${_pkgsrc}.dist-info/licenses/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
