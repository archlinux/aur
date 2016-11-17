# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Thanks to "markzz" & "Philip 'Chais' Abernethy" for the besiege PKGBUILD file!

# YOU MUST SUPPLY THE SH FILE INCLUDED WITH YOUR HUMBLE PURCHASE

pkgname=hyperlightdrifter
_gamename=HyperLightDrifter
_pkgver=2016-05-20
pkgver=${_pkgver//-/.}
pkgrel=1
_filename="HyperLightDrifter-DRMFree-Linux-${_pkgver}.sh"
pkgdesc="A 2D action role-playing game (Humble Version)"
arch=('i686' 'x86_64')
url="http://www.heart-machine.com/"
license=('custom')
depends=('libcurl-compat' 'openal' 'libxcursor' 'libpulse')
depends_x86_64=('lib32-libcurl-compat' 'lib32-openal' 'lib32-libxcursor' 'lib32-libpulse')
makedepends=('unzip')
source=("local://${_filename}"
        "hyperlightdrifter.desktop")
noextract=("${_filename}")
md5sums=('a096b029dad3d57c17288a992a1793ae'
         '060673538dadaf471bef5e83475ddf4e')

prepare() {
  if [ -d "${srcdir}/${pkgname}" ]; then
    rm -r "${srcdir}/${pkgname}"
  fi
  # unzip will issue a warning about extra bytes at beginning of file, ignore it
  unzip $_filename -d "${srcdir}/${pkgname}" || true
}

package() {
  mkdir -p "${pkgdir}/opt/${_gamename}/"
  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/applications/"

  install -Dm755 "${srcdir}/${pkgname}/data/x86/HyperLightDrifter.x86" "${pkgdir}/opt/${_gamename}/"
  cp -r "${srcdir}/${pkgname}/data/noarch/"* "${pkgdir}/opt/${_gamename}/"

  ln -s "${pkgdir}/opt/${_gamename}/HyperLightDrifter.x86" "${pkgdir}/usr/bin/hyperlightdrifter"
  install -m644 "${srcdir}/hyperlightdrifter.desktop" "${pkgdir}/usr/share/applications/hyperlightdrifter.desktop"
}

# vim:set ts=2 sw=2 et:
