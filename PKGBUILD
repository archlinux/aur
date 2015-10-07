# Maintainer: maz-1 <ohmygod19993 at gmail dot com>
pkgname=deadbeef-jack-git
_gitname=jack
pkgver=10.62d1e6a
pkgrel=1
pkgdesc="bs2b plugin for the DeaDBeeF music player"
arch=('i686' 'x86_64')
url="https://github.com/Alexey-Yakovenko/bs2b"
license=('GPL2')
depends=('deadbeef' 'jack')
source=('git+https://github.com/Alexey-Yakovenko/jack.git' 'buildfix.diff')
md5sums=('SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}

prepare() {
        cd "$srcdir/$_gitname"
        patch -p1 < ../buildfix.diff
}

build() {
  cd "${srcdir}/$_gitname"
  make
}

package() {
  cd "${srcdir}/$_gitname"

  install -Dm 755 jack.so "$pkgdir/usr/lib/deadbeef/jack.so"
}
