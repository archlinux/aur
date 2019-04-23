# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

pkgname=hg-evolve
pkgver=8.5.1
pkgrel=1
pkgdesc='Flexible evolution of Mercurial history'
arch=('any')
license=('GPL2')
depends=('mercurial<5.1')
#groups=('hgext')
url='https://www.mercurial-scm.org/doc/evolution/'
source=("https://files.pythonhosted.org/packages/source/h/hg-evolve/hg-evolve-${pkgver}.tar.gz")
sha512sums=('7c5d9608d03ab81fc7291edb3f0ddb016cd4b267997bf66fcb221c9c917fbd34bfb4637bbb0c60b460a32304ee45fd7e30db929312dfbaa94df17baf7947482e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

check() {
  # Tests depend of Mercurial sources
  if [[ -n "${HGSRC}" ]]; then
    cd "${srcdir}/${pkgname}-${pkgver}/tests"
    python2 "${HGSRC}/tests/run-tests.py"
  fi
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}"
  rm -f "${pkgdir}/usr/lib/python2.7/site-packages/hgext3rd/__init__.py"{,o,c}
}

# vim:set ts=2 sw=2 et:
