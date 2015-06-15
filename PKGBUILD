# Maintainer: Cedric Mathieu <me.xenom[at]gmail.com>

pkgname=gambatte-qt-git
_gitname="gambatte"
pkgver=f3c548d
pkgrel=1
pkgdesc="A Qt4 frontend for the Gambatte emulator"
arch=('i686' 'x86_64')
url="https://github.com/sinamas/gambatte"
license=('GPL')
depends=('qt4' 'libgl' 'alsa-lib' 'gambatte-git')
optdepends=()
makedepends=('git' 'make')
provides=('gambatte-qt')
conflicts=('gambatte-qt')
source=('git://github.com/sinamas/gambatte.git'
        $pkgname.desktop
        compil.patch)
md5sums=('SKIP'
          'd74be9dbb91c6b517099f5f1dc46c88e'
         'e2439ad2809741d89092e8a48d7ef549')

pkgver() {
  cd "$_gitname"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$_gitname"

  cd "gambatte_qt/"
  
  patch -p1 < ../../../compil.patch

  qmake-qt4 gambatte_qt.pro
  make || return 1
}

package() {

  cd "$_gitname"
  
  install -Dm755 gambatte_qt/bin/gambatte_qt "$pkgdir"/usr/bin/gambatte-qt
  install -Dm644 "$srcdir"/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}

# vim:set ts=2 sw=2 et:
