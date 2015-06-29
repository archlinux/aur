#!/bin/bash
# Above shabeng-line for automatic switch-on of syntax highlighing in some editors.

# Maintainer: Felix Becker <felix )dot( becker (at( zih )dot) tu-dresden |dot| de>.

_pkgname="pdf-zip"
pkgname="${_pkgname}"
url='http://www-example.com/no_url_since_this_is_just_a_local_script_and_no_online_upstream_available/but_the_archlinux_AUR_requires_to_have_the_url-variable_set/'
pkgver="0.2"
pkgrel="5"
pkgdesc="Combines two pdf files into one while taking the pages alternating from one and the other file. Useful to make a pdf out of two where one contains the even-numbered pages and the other the odd-numbered paged of the document."
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
        'pdf-zip.sh'   # The name of the source file of the executable is expected to be at ${source[0]}. Do not change that order. See 'package'-function.
        'license.txt'  # The name of the source file of the license is expected to be at ${source[1]}. Do not change that order. See 'package'-function.
       )

sha512sums=(
            '8fa2a5ce9f217128abf44e9d3fe856ec417584918109410e41b41ff6aa1d29a850118ff3aeada18562768d14ab867417d740d0a73cf66e9e5ae6f10e1ec3b4a9'
            '8f0c848805b6785c3ee09a37294d26904141466ff694b7a25c0fdf4862a12d80168a5894e06520c942059bc208c6877374945a2c498ce152038268d41ce09020'
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

