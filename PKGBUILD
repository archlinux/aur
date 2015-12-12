# Mantainer: MCMic <come@chilliet.eu>

pkgname=anticube2-git
pkgver=f13b180
pkgrel=2
pkgdesc="Interactive first person puzzle game based on Tesseract"
arch=('i686' 'x86_64')
url="http://quadropolis.us/node/4182"
license=('CC-BY')
depends=(tesseract-game)
makedepends=('git' 'gendesk')
source=("git://github.com/Kvaleya/Anticube2.git")
md5sums=(SKIP)
_gitname='Anticube2'
_exec='anticube2'
_name='Anticube 2'
_categories='Game;LogicGame'

pkgver() {
  cd ${_gitname}
  git describe --always | sed 's|-|.|g'
}

prepare() {
  gendesk -n -f ../PKGBUILD
}

package() {
  cd ${srcdir}/${_gitname}
  mkdir -p ${pkgdir}/usr/share/tesseract-game/
  mkdir -p ${pkgdir}/usr/bin/
  cp -r media ${pkgdir}/usr/share/tesseract-game/
  echo -e "#!/bin/sh\ntesseract-game -x\"hudgun 0; ao 0\" -lac2" > ${pkgdir}/usr/bin/anticube2 
  chmod +x ${pkgdir}/usr/bin/anticube2 
  install -Dm644 "${srcdir}/anticube2.desktop" "$pkgdir/usr/share/applications/anticube2.desktop"
  install -Dm644 "media/map/ac2.png" "$pkgdir/usr/share/pixmaps/anticube2.png"
}
