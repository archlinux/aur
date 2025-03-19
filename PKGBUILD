# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-plotink
_gitpkgname=plotink
pkgver=1.11.3
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

sha512sums=('2e776dc97eb7c717583963bbf73b8000309dba29b53adba711e80e1fd8b5de1b5c6e27dac4e7e7174e325d5d49eaf2bca63cd5e0312760b4ec3f957c83551362')

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
