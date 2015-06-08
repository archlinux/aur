# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=stalin-git
pkgver=0.11.5.51.gb9abcf0
pkgrel=2
pkgdesc="brutally optimizing Scheme compiler, with Debianization patches from github"
arch=('i686' 'x86_64')
url="https://github.com/barak/stalin"
license=('GPL')
depends=('glibc')
makedepends=('git')
provides=('stalin')
conflicts=('stalin')
source=("git+https://github.com/supergrade/stalin.git")
md5sums=('SKIP')
options=('!makeflags')
_gitname="stalin"

pkgver() {
  cd "$srcdir"/"$_gitname"
  git describe --tags | sed 's|-|.|g' | cut -c8-
}

build() {
  cd "$srcdir"/"$_gitname"
  ./build
}

package() {
  install -Dm644 $srcdir/"$_gitname"/"$_gitname".1 \
	  $pkgdir/usr/share/man/man1/"$_gitname".1
  install -Dm755 $srcdir/"$_gitname"/include/"$_gitname" \
	  $pkgdir/usr/bin/"$_gitname"
}
