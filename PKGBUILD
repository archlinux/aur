# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

pkgname=hg-evolve
pkgver=9.2.2
pkgrel=1
pkgdesc='Flexible evolution of Mercurial history'
arch=('any')
license=('GPL2')
depends=('mercurial')
#groups=('hgext')
url='https://www.mercurial-scm.org/doc/evolution/'
source=("https://files.pythonhosted.org/packages/source/h/hg-evolve/hg-evolve-${pkgver}.tar.gz")
sha512sums=('54a99287e7d8355568577c3b2bff80f374cc681367bf10e105f67c45c02b0bf2be25460af6d4ce9df7567494bab5f7a64fbcd4c6327bd473794fb3b3254b00b9')

_pyexe=$(hg debuginstall | perl -nE "/Python executable \((.*)\)/ and print \$1")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

check() {
  # Tests depend of Mercurial sources
  if [[ -n "${HGSRC}" ]]; then
    cd "${srcdir}/${pkgname}-${pkgver}/tests"
    "$_pyexe" "${HGSRC}/tests/run-tests.py"
  fi
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  "$_pyexe" setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}"
  rm -f "${pkgdir}/usr/lib/python"*"/site-packages/hgext3rd/"{__pycache__/,}"__init__"*".py"{,o,c}
}

# vim:set ts=2 sw=2 et:
