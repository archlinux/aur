# Maintainer: Dmitry Kharitonov <arch[at]nano-model[dot]com>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=noblenote-git
pkgver=609.17abdf4
pkgrel=1
pkgdesc="nobleNote aims to be a lightweight, open source alternative to Evernote and OneNote."
url="https://github.com/hakaishi/nobleNote"
arch=('i686' 'x86_64')
license=('BSD')
depends=('qt5-base' 'qt5-tools')
makedepends=('git')
source=('git+https://github.com/hakaishi/nobleNote.git')
md5sums=('SKIP')

pkgver() {    
  cd $srcdir/nobleNote
  echo $(git rev-list --count master).$(git rev-parse --short master)
}


build() {
   cd $srcdir/nobleNote
   qmake
}

package() {
   cd $srcdir/nobleNote
   make INSTALL_ROOT=$pkgdir install
   # Desktop icon
   install -Dm644 noblenote.desktop $pkgdir/usr/share/applications/noblenote.desktop
   sed -i 's|Icon=noblenote|Icon=/usr/share/pixmaps/noblenote-icons/noblenote|' $pkgdir/usr/share/applications/noblenote.desktop
}
