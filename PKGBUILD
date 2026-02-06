# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

pkgname=hg-evolve
_srcdirname=hg_evolve
pkgver=12.0.0
pkgrel=1
pkgdesc='Flexible evolution of Mercurial history'
arch=('any')
license=('GPL-2.0-or-later')
depends=('mercurial')
makedepends=('python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
#groups=('hgext')
url='https://www.mercurial-scm.org/doc/evolution/'
source=("https://files.pythonhosted.org/packages/source/h/hg-evolve/hg_evolve-${pkgver}.tar.gz")
sha512sums=('8891421b927bd255b4032adc2d97824d7ed875294323f777f4b8dabfe7fe0df7ee9e59090e1c6cf345a199d7f8ddd8c5e969180d22273c50fde68de3fb8a35e4')

build() {
  cd "${srcdir}/${_srcdirname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  # Tests depend of Mercurial sources
  if [[ -n "${HGSRC}" ]]; then
    cd "${srcdir}/${_srcdirname}-${pkgver}/tests"
    python "${HGSRC}/tests/run-tests.py"
  fi
}

package() {
  cd "${srcdir}/${_srcdirname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm -f "${pkgdir}/usr/lib/python"*"/site-packages/hgext3rd/"{__pycache__/,}"__init__"*".py"{,o,c}
}

# vim:set ts=2 sw=2 et:
