# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-plotink
_gitpkgname=plotink
pkgver=1.11.1
pkgrel=1
pkgdesc='Common files for Inkscape extensions to drive EggBot, WaterColorBot, and similar plotter-type machines'
arch=('any')
url='https://github.com/evil-mad/plotink'
license=('MIT')
depends=(
  'python'
  'python-mpmath'
  'python-packaging'
  'python-pyserial'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
options=('!debug' '!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/evil-mad/plotink/archive/refs/tags/v${pkgver}.tar.gz"
)

sha512sums=(
  '06cab4589ed2b6d0f0ba08e27d80a31a534f9c0197bb773ad9c9659e5440a2c1dcc463d7af53d24f053137aea7937e342e3361a29360d810fb4a88a1e4c3c80c'
)

build() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_gitpkgname}-${pkgver}"
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging README.md'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${srcdir}/${_gitpkgname}-${pkgver}/README.md"

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/${_gitpkgname}-${pkgver}/LICENSE"
}
