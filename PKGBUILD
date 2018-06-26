# Maintainer: Samuel Ace Winchenbach <swinchen at gmail dot com>
_pkgname=epm
pkgname="${_pkgname}-git"
license=('GPL2')
arch=('i686' 'x86_64')
pkgver=v4.4.r2.ge7b5b4c
pkgrel=1
pkgdesc="ESP Package manager is a UNIX software and file packaging program"
url="https://github.com/michaelrsweet/epm"
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')
depends=('glibc')
replaces=('epm')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed "s/-/.r/;s/-/./g"
}

build() {
  cd $srcdir/${_pkgname}
  ./configure --prefix=/usr
  make
}

package(){
  cd $srcdir/${_pkgname}
  make DESTDIR=${pkgdir} install
}
