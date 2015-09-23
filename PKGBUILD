#!/bin/bash
# Above shabeng-line for automatic switch-on of syntax highlighing in some editors.

# Maintainer: dreieck, oid )underscore) maps |at| airpost (dot) net.

_pkgname="pdf-append"
pkgname="${_pkgname}"
pkgver="0.3"
pkgrel="2"
pkgdesc="Combines an arbitrary amount of pdf documents into one by appending the documents one after another."
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
        'pdf-append.sh' # The name of the source file of the executable is expected to be at ${source[0]}. Do not change that order. See 'package'-function.
        'license.txt'    # The name of the source file of the license is expected to be at ${source[1]}. Do not change that order. See 'package'-function.
       )

sha512sums=(
            '152bfe65fe66e13713c8ec648b1ca3b3693c33d7a58f32947d3095a6fc6d9e379d406fe002ed06a3a895e7582527db2473b6fe6dc9c7896a079c813b25d90f96'
            '46f9bc2d587b31b971a31dfcb77710821275cf4678c6116f3cebe62afa86f5431128d4e46c343d89c626f1aa5298218c115e64ea0723e35046b04ca98b16c5ac'
           )

package()
{
  _executablesourcefilename="${source[0]}"
  _licensesourcefilename="${source[1]}"
  
  _executabletargetfilename="${_pkgname}"
  _licensetargetfilename="${_licensesourcefilename}"
  _licensetargetgenericfilename="COPYING"
  
  _instdir='/usr/bin'
  _instdir_pkgdir="${pkgdir}${_instdir}"
  
  _licensedir="/usr/share/licenses/${pkgname}"
  _licensedir_pkgdir="${pkgdir}${_licensedir}"
  
  install -D -g root -m 755 -o root -p -v "${srcdir}/${_executablesourcefilename}" "${_instdir_pkgdir}/${_executabletargetfilename}"
  install -D -g root -m 644 -o root -p -v "${srcdir}/${_licensesourcefilename}" "${_licensedir_pkgdir}/${_licensetargetfilename}"
  cd "${_licensedir_pkgdir}" && ln -sv "${_licensetargetfilename}" "${_licensetargetgenericfilename}"
}
