# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=mythryl-git
pkgver=20100319
pkgrel=1
pkgdesc="A modern typesafe, threadsafe, stackless ML."
url="http://mythryl.com/"
arch=('i686')  # might be able to do x86_64 with multilib
license=('GPL3')
depends=("gtk2" "gtkglext")
makedepends=('git')
conflicts=("mythryl")
provides=("mythryl")
source=('git://github.com/mythryl/mythryl.git')
md5sums=('SKIP')

_gitname="mythryl"

pkgver() {
  cd "$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd "$_gitname"
  ./Configure
  make compiler
  #make rest
}

package() {
  cd "$_gitname"
  #make DESTDIR="$pkgdir" install
  # No destdir, no prefix.  Let's do it by hand!
  install -d "$pkgdir/usr/bin/"
  find bin/ -executable -type f | xargs install -Dm755 "$pkgdir/usr/bin/"
}
