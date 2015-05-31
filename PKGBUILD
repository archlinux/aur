# Maintainer: Can Celasun <dcelasun[at]gmail[dot]com>
pkgname=castles-in-the-sky
pkgver=1
pkgrel=3
pkgdesc="A game by the Tall Trees"
arch=(i686 x86_64)
url="http://thetalltreesgames.co.uk/CastlesInTheSky/"
license=('custom')
depends=(wine)
makedepends=(p7zip)
_sourcefile=castlesinthesky_win_12232013.exe
noextract=(${_sourcefile})
source=(castles-in-the-sky)
md5sums=('67b7e26884e1cc0d73c338e531ebff2a')

package() {
  msg "You need a full copy of this game in order to install it"
  msg "Searching for ${_sourcefile} in dir: \"$startdir\""
  pkgpath="$startdir"
  if [[ ! -f "${pkgpath}/${_sourcefile}" ]]; then
    error "Game installer not found, please type absolute path to ${_sourcefile} (/home/joe):"
    read pkgpath
    if [[ ! -f "${pkgpath}/${_sourcefile}" ]]; then
      error "Unable to find game package." && return 1
    fi
  fi
  msg "Found game package, unpacking..."

  cd "${srcdir}"
  
  7z x -aoa -o"${srcdir}/exe" ${pkgpath}/${_sourcefile}
  
  install -d -m755  "${pkgdir}/usr/share/${pkgname}"
  install -d -m755  "${pkgdir}/usr/share/licenses/${pkgname}"
  
  cp -ra "${srcdir}"/exe/* "${pkgdir}/usr/share/${pkgname}"
  cp "${srcdir}/exe/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  find "${pkgdir}/usr/share/${pkgname}" -type d -exec chmod 755 "{}" \;
  find "${pkgdir}/usr/share/${pkgname}" -type f -exec chmod 644 "{}" \;


  # Remove spaces in the exe file
  mv "${pkgdir}/usr/share/${pkgname}/Castles in the Sky.exe" "${pkgdir}/usr/share/${pkgname}/CastlesInTheSky.exe"
  
  install -d -m755 "${pkgdir}/usr/bin"
  install -m755 castles-in-the-sky "${pkgdir}/usr/bin"
}
