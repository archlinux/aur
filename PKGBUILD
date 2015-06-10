# Mantainer: Diego <cdprincipeat gmaildot com>
# Contributor: Stjepan Glavina <stjepang@gmail.com>
# Contributor: Markus Gross <xsdnyd@gmail.com>
# Contributor: Andrea Fagiani <andfagiani _at_ gmail dot com>
pkgname=stjerm
pkgver=0.18
pkgrel=1
pkgdesc="Drop-down terminal emulator. Stable"
arch=('i686' 'x86_64')
url="https://github.com/stjerm/stjerm"
license=('GPL')
depends=('vte')
makedepends=('autoconf' 'git')
conflicts=('stjerm-git')
source=($pkgname::git://github.com/stjerm/stjerm.git)
md5sums=(SKIP)

build() {
  cd $srcdir/$pkgname
  git checkout v$pkgver || git checkout $pkgver
  touch README
  ./autogen.sh
  export LIBS=-lXinerama
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname
  make DESTDIR="$pkgdir/" install
}
