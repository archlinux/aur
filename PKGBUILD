# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

pkgname=hg-evolve
pkgver=8.2.0
pkgrel=2
pkgdesc='Flexible evolution of Mercurial history'
arch=('any')
license=('GPL2')
depends=('mercurial<4.8')
#groups=('hgext')
url='https://www.mercurial-scm.org/doc/evolution/'
source=("https://files.pythonhosted.org/packages/source/h/hg-evolve/hg-evolve-${pkgver}.tar.gz")
sha512sums=('1f0207d1f5c3c61eee9758ba7d3ecea386f9c1f08808d66801fabc0bf108ec693f2f633b1a3512c6214748a5cb1ef5189accd203a19c4ae280c85298f225e869')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Tests depend of Mercurial sources
  if [[ -n "$HGSRC" ]]; then
    make tests HGROOT="${HGSRC}" PYTHON=python2
  fi
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --optimize=1 --prefix=/usr --root="$pkgdir"
  rm -f "${pkgdir}/usr/lib/python2.7/site-packages/hgext3rd/__init__.py"{,o,c}
}

# vim:set ts=2 sw=2 et:
