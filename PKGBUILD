# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=supermodel
pkgver=0.3a_git_b6716e1
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc='A Sega Model 3 Arcade Emulator'
url='https://github.com/trzy/Supermodel'
license=('GPL3')
arch=('x86_64')
depends=('sdl2_net' 'glu')

source=(
  "https://github.com/trzy/Supermodel/archive/refs/tags/v${_pkgver}.tar.gz"
  "${pkgname}.desktop"
)

sha512sums=(
  '456c214bf97e8f40f3fc339537ad1dfcc91d460902db55a81cc712ae18b450c06239e5644f67be99cf6e4117ac694580722eeac79cdf64c90e390def16d6bd3f'
  '13266c13ecbaccc2a156c41d2d42a271d9bc4bffcfe794a875a10128e97981558302ee9f7b5b8dd8c87ef8b00c5b5216843a9576917f9dd37a13a0455a1bba69'
)

build() {
  cd Supermodel-${_pkgver}
  make -f Makefiles/Makefile.UNIX NET_BOARD=1
}

package() {
  install -Dm644 "${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
  cd Supermodel-${_pkgver}
  install -Dm644 Docs/Images/Real3D_Logo.png "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -Dm755 bin/supermodel "$pkgdir/usr/bin/supermodel"
  install -Dm644 Docs/README.txt "$pkgdir/usr/share/doc/$pkgname/README.txt"
  install -Dm644 Config/Games.xml "$pkgdir/usr/share/doc/$pkgname/config/Games.xml"
  install -Dm644 Config/Music.xml "$pkgdir/usr/share/doc/$pkgname/config/Music.xml"
}
