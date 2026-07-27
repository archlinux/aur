# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=supermodel
pkgver=0.3a_20260726_git_8488f0d
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc='A Sega Model 3 Arcade Emulator'
url='https://github.com/trzy/Supermodel'
license=('GPL3')
arch=('x86_64')
depends=('glu' 'sdl2_net' 'zenity')

source=(
  "https://github.com/trzy/Supermodel/archive/refs/tags/v${_pkgver}.tar.gz"
  "$pkgname"
  "${pkgname}.desktop"
)

sha512sums=(
  '205e3bddf119071b39c7621c022ff9558235d30f6f2c8bc2856039f27a0bc16de2a9323d28df6e58057a45f08b99ea6a5cf1a6cd00aa8dbd674a44a1aebd0106'
  'bf62d43965ae51db0ce2c7d62a5a38253ce468ed0682df627a0e648aadd7eb85a5b35fb82354cc6f4163a49627ae9419a47eae12a0a4d3c2da9f743539bd788c'
  '13266c13ecbaccc2a156c41d2d42a271d9bc4bffcfe794a875a10128e97981558302ee9f7b5b8dd8c87ef8b00c5b5216843a9576917f9dd37a13a0455a1bba69'
)

build() {
  cd Supermodel-${_pkgver}
  make -f Makefiles/Makefile.UNIX NET_BOARD=1
}

package() {
  install -Dm644 "${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
  install -Dm755 "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  cd Supermodel-${_pkgver}
  install -Dm644 Docs/Images/Real3D_Logo.png "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -Dm755 bin/supermodel "$pkgdir/usr/bin/supermodel-binary"
  install -Dm644 Docs/README.txt "$pkgdir/usr/share/doc/$pkgname/README.txt"
  install -dm755 "$pkgdir/usr/share/$pkgname/Assets"
  cp Assets/* "$pkgdir/usr/share/$pkgname/Assets/"
  install -Dm644 Config/Games.xml "$pkgdir/usr/share/$pkgname/Config/Games.xml"
  install -Dm644 Config/Music.xml "$pkgdir/usr/share/$pkgname/Config/Music.xml"
}
