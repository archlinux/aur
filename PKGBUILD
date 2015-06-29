#!/bin/bash
### Above line for automatic syntax highlighting editors.

# Maintainer: Felix Becker <felix )dot( becker (at( zih )dot) tu-dresden |dot| de>.

pkgname="pom"
pkgver="0.14"
pkgrel="1"
pkgdesc="Display the phase of the moon."
arch=('any')
url='http://search.cpan.org/dist/ppt/bin/pom'
depends=('perl')
license=('GPL2')
source=("http://search.cpan.org/CPAN/authors/id/C/CW/CWEST/ppt-${pkgver}.tar.gz")

sha512sums=('3df3faa027002bfa2e9b774a9ca112d12ae01cb1142208ae6ffcd38b96bba03e73d76c38e6f0f93901ad1b54a99f4c09478718edcf7eab1b5c0a51f61051d467')


build()
{
  _extractdir="${srcdir}/ppt-${pkgver}"
  echo ""
  echo ">>> Building '${pkgname}', version '${pkgver}'. >>>"
  echo ""

  cd "${_extractdir}" || exit 11

  perl Makefile.PL PREFIX=/usr || exit "$?"
  make || exit "$?"

  echo ""
  echo "<<< Finished building '${pkgname}', version '${pkgver}'. <<<"
  echo ""
}

package()
{
  _extractdir="${srcdir}/ppt-${pkgver}"
  _instdir="/usr/bin"
  _docinstdir="/usr/share/doc/${pkgname}"
  
  cd "${_extractdir}"
  
  mkdir -p "${pkgdir}/${_instdir}"    || exit 21
  mkdir -p "${pkgdir}/${_docinstdir}" || exit 22
  
  ### Only install 'pom'.
  cp -v bin/pom "${pkgdir}/${_instdir}" || exit "$?"
  
  cp -av html/commands/pom "${pkgdir}/${_docinstdir}/html" || exit "$?"
}

