# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

pkgname=hg-evolve
pkgver=8.3.0
pkgrel=1
pkgdesc='Flexible evolution of Mercurial history'
arch=('any')
license=('GPL2')
depends=('mercurial<4.8')
#groups=('hgext')
url='https://www.mercurial-scm.org/doc/evolution/'
source=("https://files.pythonhosted.org/packages/source/h/hg-evolve/hg-evolve-${pkgver}.tar.gz")
sha512sums=('2a1861d3a061a2d0574fb0342bc9c6cedf253db8737c2e1a33e2446028746f271a4abbe25b314506a5356c80d67510358f6df207950b2925ff61dc1ae5f5a609')

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
