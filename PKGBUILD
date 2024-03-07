# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

pkgname=hg-evolve
pkgver=11.1.2
pkgrel=1
pkgdesc='Flexible evolution of Mercurial history'
arch=('any')
license=('GPL-2.0-or-later')
depends=('mercurial')
makedepends=('python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
#groups=('hgext')
url='https://www.mercurial-scm.org/doc/evolution/'
source=("https://files.pythonhosted.org/packages/source/h/hg-evolve/hg-evolve-${pkgver}.tar.gz")
sha512sums=('6074f261157690610e834440c58f92f08ed78c7f55c0d3c2523aaa6ab83772a19ba2c171568527f09e1221d418cb3d294b31960bb52ead0d9d1398eef5e9d079')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  # Tests depend of Mercurial sources
  if [[ -n "${HGSRC}" ]]; then
    cd "${srcdir}/${pkgname}-${pkgver}/tests"
    python "${HGSRC}/tests/run-tests.py"
  fi
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm -f "${pkgdir}/usr/lib/python"*"/site-packages/hgext3rd/"{__pycache__/,}"__init__"*".py"{,o,c}
}

# vim:set ts=2 sw=2 et:
