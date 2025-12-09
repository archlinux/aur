# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

pkgname=hg-evolve
_srcdirname=hg_evolve
pkgver=11.1.10
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
sha512sums=('d81ac188fb3cd971395dd3f27743a09cbf5363f0c69bd7a7186b11f6f5c72ee8dc732b294231ca18fe425ed9ac336e26ecfa01a321daf38fc7603593c492eacc')

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
