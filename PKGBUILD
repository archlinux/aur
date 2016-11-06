# Maintainer: Can Celasun <dcelasun[at]gmail[dot]com>
pkgname=one-night-stand
_pkgname=One_Night_Stand
pkgver=2.04
pkgrel=2
pkgdesc="A game about the morning after a one night stand."
arch=(i686 x86_64)
url="https://kinmoku.itch.io/one-night-stand"
license=('custom')
depends_i686=(libxmu python2 ffmpeg libpng12 libxi freetype2 glu)
depends_x86_64=(lib32-libxmu python2 ffmpeg libpng12 lib32-libxi lib32-freetype2 lib32-glu lib32-libpng12)
options=(!strip)
source=($pkgname
        $pkgname.desktop
        $pkgname.png)
md5sums=('2657cf2dc573bd4a64f72206006df0e5'
         'bcbceaa2d0ec7d28b463fa7bcefe1ec0'
         'c4940f2ee254374eb096bc46b82bdae7')
_pkg=${_pkgname}_$pkgver-linux.tar.bz2
package() {
  msg "You need a full copy of the game in order to install it"
  msg "You can download it here: https://kinmoku.itch.io/one-night-stand"
  msg "Searching for ${_pkg} in dir: \"$startdir\""
  pkgpath="$startdir"
  if [[ ! -f "${pkgpath}/${_pkg}" ]]; then
    error "Game package not found, please type absolute path to ${_pkg} (/home/joe):"
    read pkgpath
    if [[ ! -f "${pkgpath}/${_pkg}" ]]; then
      error "Unable to find game package." && return 1
    fi
  fi
  msg "Found package, unpacking..."
  tar xf "${pkgpath}/${_pkg}" -C "${srcdir}"
  
  mkdir -p "${pkgdir}"/usr/bin
  mkdir -p "${pkgdir}"/opt/${pkgname}
  mkdir -p "${pkgdir}"/usr/share/{applications,icons}
  
  cd "${srcdir}"/${_pkgname}_${pkgver}-linux

  cp * "${pkgdir}"/opt/${pkgname} -R

  install -m755 "${srcdir}"/$pkgname "${pkgdir}"/usr/bin/${pkgname}

  install -m644 "${srcdir}"/${pkgname}.png "${pkgdir}"/usr/share/icons
  install -m644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications

  chmod +x "${pkgdir}"/usr/bin/${pkgname}
}
