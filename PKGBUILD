# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Thanks to "markzz" & "Philip 'Chais' Abernethy" for the besiege PKGBUILD file!

# YOU MUST SUPPLY THE SH FILE INCLUDED WITH YOUR HUMBLE PURCHASE

pkgname=hyperlightdrifter
_gamename=HyperLightDrifter
_pkgver=2017-06-01
pkgver=${_pkgver//-/.}
pkgrel=2
_filename="HyperLightDrifter-DRMFree-Linux-${_pkgver}.sh"
pkgdesc="A 2D action role-playing game (Humble Version)"
arch=('i686' 'x86_64')
url="http://www.heart-machine.com/"
license=('custom')
depends=('libcurl-compat' 'openal' 'libxcursor' 'libpulse')
depends_x86_64=('lib32-libcurl-compat' 'lib32-openal' 'lib32-libxcursor' 'lib32-libpulse')
makedepends=('unzip')
source=("local://${_filename}"
        "hyperlightdrifter.desktop"
        "hyperlightdrifter.sh")
noextract=("${_filename}")
md5sums=('c85ab8e098d686adb93693055a20c152'
         '7c76043e6b67ff4abe3c7c589b110132'
         '489f12df8313d8f4fc422553fa4f2d43')

prepare() {
  if [ -d "${srcdir}/${pkgname}" ]; then
    rm -r "${srcdir}/${pkgname}"
  fi
  # unzip will issue a warning about extra bytes at beginning of file, ignore it
  unzip $_filename -d "${srcdir}/${pkgname}" || true
}

package() {
  mkdir -p "$pkgdir/opt/$_gamename/"
  install -Dm755 "$srcdir/$pkgname/data/x86/HyperLightDrifter.x86" "$pkgdir/opt/$_gamename/"
  cp -r "$srcdir/$pkgname/data/noarch/"* "$pkgdir/opt/$_gamename/"

  install -Dm755 "$srcdir/hyperlightdrifter.sh" "$pkgdir/usr/bin/hyperlightdrifter"
  install -Dm644 "$srcdir/hyperlightdrifter.desktop" "$pkgdir/usr/share/applications/hyperlightdrifter.desktop"
}

# vim:set ts=2 sw=2 et:
