# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

pkgname=hg-evolve
pkgver=8.1.2
pkgrel=1
pkgdesc='Flexible evolution of Mercurial history'
arch=('any')
license=('GPL2')
depends=('mercurial<=4.7')
#groups=('hgext')
url='https://www.mercurial-scm.org/doc/evolution/'
source=("https://files.pythonhosted.org/packages/source/h/hg-evolve/hg-evolve-${pkgver}.tar.gz")
sha512sums=('7cef977a307b3787461386398d9fcbd1f8276777a162b5c4d194c77cfa07fc5747a4770243f173a2dc61009eb3b6ae0173d9e13ca189b2ea9799d5fca753472e')

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
