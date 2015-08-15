# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=eel-language-git
pkgver=0.3.6.119.g295b9b3
pkgrel=1
pkgdesc="A scripting and programming language, git version"
arch=('i686' 'x86_64')
url="http://www.olofson.net"
license=('custom')
depends=('bash' 'audiality')
makedepends=('git')
provides=('eel-language')
conflicts=('eel-language')
options=('!libtool' 'staticlibs')
source=("git+https://github.com/olofson/eel.git")
md5sums=('SKIP')
_gitname="eel"

pkgver() {
  cd "$srcdir"/"$_gitname"
  git describe --tags | sed 's|-|.|g'
}

build() {
  cd "$srcdir"/"$_gitname"
  [ -d bld ] || mkdir bld
  cd bld
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE="Release" 
  
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}
