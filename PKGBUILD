# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

pkgname=hg-evolve
pkgver=8.1.0
pkgrel=1
pkgdesc='Flexible evolution of Mercurial history'
arch=('any')
license=('GPL2')
depends=('mercurial')
#groups=('hgext')
url='https://www.mercurial-scm.org/doc/evolution/'
source=("https://files.pythonhosted.org/packages/source/h/hg-evolve/hg-evolve-${pkgver}.tar.gz")
sha512sums=('33c78f96aac97803d1b9cdb1c0ed696219c07367f250dd15806bb774d70ecad7a057dafb1988e8ef158798da599e9998fa33424f95a89647675940343c4feec6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

check() {
  # Tests depend of Mercurial sources
  if [[ -n "$HGSRC" ]]; then
    cd "${srcdir}/${pkgname}-${pkgver}/tests"
    python2 "${HGSRC}/tests/run-tests.py"
  fi
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --optimize=1 --prefix=/usr --root="$pkgdir"
  rm -f "${pkgdir}/usr/lib/python2.7/site-packages/hgext3rd/__init__.py"{,o,c}
}

# vim:set ts=2 sw=2 et:
