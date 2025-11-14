# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=supermodel
pkgver=0.3a_20251112_git_04ee1b9
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
  '258.diff'
)

sha512sums=(
  'e9c083f954783b973018e26b867d193211e4fc849a3ad8ccd348ad6dc07e4a70c878ead97588dea3dd95463a3287f835781a7faca6954cd625f48b738f6e59fb'
  'cc328bbd65142af9ea61dda371b89cf76007213e697b320b615a64c0f5df9d6ac0c59ccfdd313b85acf7aa3989790f93bca97dda9d327765fd659afc8bd4f1e3'
  '13266c13ecbaccc2a156c41d2d42a271d9bc4bffcfe794a875a10128e97981558302ee9f7b5b8dd8c87ef8b00c5b5216843a9576917f9dd37a13a0455a1bba69'
  '894296aa2c691a23e52e0e6d45070bc86b662b7faefd57e790b2bbabe8e706fabaccba8029dc3cadd10939773e5c761575b7d9b5933a7d547e5e2a25e9111064'
)

prepare() {
  cd Supermodel-${_pkgver}
  patch -p1 < ../258.diff
}

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
