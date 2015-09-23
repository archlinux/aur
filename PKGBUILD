#!/bin/bash
# Above shabeng-line for automatic switch-on of syntax highlighing in some editors.

# Maintainer: dreieck, oid[underscore[maps |at)airpost (dot( net

_pkgname="pdf-reverse"
pkgname="${_pkgname}"
pkgver="0.2"
pkgrel="1"
pkgdesc="Reverses the page order of a pdf file."
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
        'pdf-reverse.sh' # The name of the source file of the executable is expected to be at ${source[0]}. Do not change that order. See 'package'-function.
        'license.txt'    # The name of the source file of the license is expected to be at ${source[1]}. Do not change that order. See 'package'-function.
       )

sha512sums=(
            '33f2c7b99db309f2034a853630da6ba9c8b51fc60b87435b8103e2f713271ffd592ab9b160ed1d7693b103cd5204622c71f495e1ea3f79f4a3e8dac8973e3932'
            'b0eabc7662e8c8f3d86753b13937df5684e70dc8ee53e2ab852d5311a5f7c4e8ac02f03e13ccef94770d3ca691282d9323945a27cd5bb4e83f91369ba8e8e569'
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

