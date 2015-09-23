#!/bin/bash
# Above shabeng-line for automatic switch-on of syntax highlighing in some editors.

# Maintainer: dreieck, oid(underscore [ mals ) at)airpost(dot(net.

_pkgname="pdf-zip"
pkgname="${_pkgname}"
pkgver="0.2.5"
pkgrel="1"
pkgdesc="Combines two pdf files into one while taking the pages alternating from one and the other file (shuffling them into each other). Containes a variant reversing the second file before combining."
arch=('any')
depends=(
         'bash'
         'pdftk'
        )
makedepends=(
            )
optdepends=(
           )
license=(
         'custom'
        )

### !!! IMPORTANT: Do not change the order of the entries in the 'source'-array. The entries here are used to determine the names of the source-files in the 'package'-function, and a fixed order is assumed. ###
source=(
        'pdf-zip.sh'
        'pdf-zip-rev.sh'
        'license.txt'    # The name of the source file of the license is expected to be at ${source[2]}. Do not change that order. See 'package'-function.
       )

sha512sums=(
            '8fa2a5ce9f217128abf44e9d3fe856ec417584918109410e41b41ff6aa1d29a850118ff3aeada18562768d14ab867417d740d0a73cf66e9e5ae6f10e1ec3b4a9'
            'd83c3ab20060347e2ec3a732b7ab24a59276aa4bd9ca609f775af1deb08eab8deac8de0688554c8cfaf086b4a3f8a59159110ddfdf0a9d20f5319b1a54a360c4'
            '8f0c848805b6785c3ee09a37294d26904141466ff694b7a25c0fdf4862a12d80168a5894e06520c942059bc208c6877374945a2c498ce152038268d41ce09020'
           )

package()
{
  _licensesourcefilename="${source[2]}"
  
  _licensetargetfilename="${_licensesourcefilename}"
  _licensetargetgenericfilename="COPYING"
  
  _instdir='/usr/bin'
  _instdir_pkgdir="${pkgdir}${_instdir}"
  
  _licensedir="/usr/share/licenses/${pkgname}"
  _licensedir_pkgdir="${pkgdir}${_licensedir}"
  
  install -D -g root -m 755 -o root -p -v "${srcdir}/pdf-zip.sh" "${_instdir_pkgdir}/pdf-zip"
  install -D -g root -m 755 -o root -p -v "${srcdir}/pdf-zip-rev.sh" "${_instdir_pkgdir}/pdf-zip-rev"
  install -D -g root -m 644 -o root -p -v "${srcdir}/${_licensesourcefilename}" "${_licensedir_pkgdir}/${_licensetargetfilename}"
  cd "${_licensedir_pkgdir}" && ln -sv "${_licensetargetfilename}" "${_licensetargetgenericfilename}"
}
