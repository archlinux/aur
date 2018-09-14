# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

pkgname=hg-evolve
pkgver=8.2.1
pkgrel=1
pkgdesc='Flexible evolution of Mercurial history'
arch=('any')
license=('GPL2')
depends=('mercurial<4.8')
#groups=('hgext')
url='https://www.mercurial-scm.org/doc/evolution/'
source=("https://files.pythonhosted.org/packages/source/h/hg-evolve/hg-evolve-${pkgver}.tar.gz")
sha512sums=('f9dd2078cfb2de85504747ef48c454fc0ddea3cc36988849e4652451cd18a92044bee4e3eb9866e44df81136c363c60e06777ff95b98a605719a0be824ca3c07')

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
