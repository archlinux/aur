# Maintainer: Evgeny Pokhilko <software@evpo.net>

_pkgname=encryptpad
pkgname=${_pkgname}
pkgver=0.5.0.2
pkgrel=10
pkgdesc="Minimalist secure text editor and file encryptor that implements RFC 4880 Open PGP format"
arch=(i686 x86_64)
url="https://github.com/evpo/${_pkgname}"
license=('GPL2')
depends=('qt5-base' 'hicolor-icon-theme' 'python' 'botan' 'zlib' 'bzip2')
makedepends=('git')
options=('!makeflags')
validpgpkeys=('634BFC0CCC426C74389D89310F1CFF71A2813E85')
source=("https://github.com/evpo/EncryptPad/releases/download/v${pkgver}/encryptpad$(echo -n $pkgver | sed -r 's/\./_/g')_src.tar.gz"{,.asc})

sha1sums=('SKIP' 'SKIP')

build() {
  cd "$srcdir/encryptpad$(echo -n $pkgver | sed -r 's/\./_/g')_src"
  ./configure.py
  make
}

package() {
  cd "$srcdir/encryptpad$(echo -n $pkgver | sed -r 's/\./_/g')_src"
  mkdir -p "${pkgdir}"/usr/bin
  install -Dm755 bin/release/encryptcli bin/release/encryptpad "${pkgdir}"/usr/bin/
  install -Dm644 ${_pkgname}.desktop "${pkgdir}"/usr/share/applications/${_pkgname}.desktop
  install -Dm644 images/icns.iconset/icon_16x16.png "${pkgdir}"/usr/share/icons/hicolor/16x16/apps/${_pkgname}.png
  install -Dm644 images/icns.iconset/icon_32x32.png "${pkgdir}"/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png
  install -Dm644 images/icns.iconset/icon_128x128.png "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png
}

# vim:set ts=2 sts=2 sw=2 et:
