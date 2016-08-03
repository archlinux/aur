# Mantainer: MCMic <come@chilliet.eu>

pkgname=mysticmine-git
pkgver=2fc0a5e
pkgrel=2
pkgdesc="A one-button multiplayer mining cart game"
arch=('any')
url="http://www.mysticmine.com"
license=('MIT')
depends=('python2' 'python2-pygame' 'pyrex' 'python2-numpy')
makedepends=('git')
source=("git://github.com/koonsolo/MysticMine.git")
md5sums=(SKIP)
_gitname='MysticMine'
_exec='MysticMine'
_name='Mystic Mine'
_categories='Game;LogicGame'

pkgver() {
  cd ${_gitname}
  git describe --always | sed 's|-|.|g'
}

prepare() {
  gendesk -n -f ../PKGBUILD
}

build() {
  cd ${srcdir}/${_gitname}
  make
}

package() {
  cd ${srcdir}/${_gitname}
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 "${srcdir}/mysticmine.desktop" "$pkgdir/usr/share/applications/mysticmine.desktop"
#  install -Dm644 "${srcdir}/mysticmine.png" "$pkgdir/usr/share/pixmaps/mysticmine.png"
}
