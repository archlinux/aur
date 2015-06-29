#!/bin/bash
### Above line for automatic syntax highlighting editors.

# Maintainer: Felix Becker <felix )dot( becker (at( zih )dot) tu-dresden |dot| de>.

pkgname="solunar"
pkgver="0.1.0"
pkgrel="1"
pkgdesc="A simple command-line utility for calculating Sun and Moon rise and set, and related times."
arch=('i686' 'x86_64')
url='http://kevinboone.net/README_solunar.html'
depends=('glibc' 'tzdata')
license=('GPL2')
source=("http://kevinboone.net/solunar.tar.gz")

sha512sums=('789ab10251ccea39a121050a4b114216181c38d1182ca7dca2452402e129a65d9d47d3d6e219f595d703133063e271bc65b6d0942418039029a8bf963b29719b')


build()
{
  _extractdir="${srcdir}/solunar-${pkgver}"
  echo ""
  echo ">>> Building '${pkgname}', version '${pkgver}'. >>>"
  echo ""

  cd "${_extractdir}" || exit 11

  make || exit "$?"

  echo ""
  echo "<<< Finished building '${pkgname}', version '${pkgver}'. <<<"
  echo ""
}

package()
{
  _extractdir="${srcdir}/solunar-${pkgver}"
  _instdir="/usr/bin"
  _docinstdir="/usr/share/doc/${pkgname}"
  
  cd "${_extractdir}"
  
  mkdir -p "${pkgdir}/${_instdir}"    || exit 21
  mkdir -p "${pkgdir}/${_docinstdir}" || exit 22
  
  ### Not use 'make install', since that will not install below '${pkgdir}'. 'make DESTDIR="${pkgdesc}"' seems not to work either.
  cp -v solunar "${pkgdir}/${_instdir}" || exit "$?"
  
  cp -v README_solunar.html NOTES TODO "${pkgdir}/${_docinstdir}/" || exit "$?"
}

