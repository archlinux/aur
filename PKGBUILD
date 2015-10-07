# Maintainer: Peter Lamby <peterlamby@web.de>
pkgname=deadbeef-stereo-widener-git
_gitname=stereo-widener
pkgver=5.d3990d7
pkgrel=1
pkgdesc="stereo widener plugin for the DeaDBeeF music player"
arch=('i686' 'x86_64')
url="https://github.com/Alexey-Yakovenko/stereo-widener"
license=('GPL2')
depends=('deadbeef')
source=('git+https://github.com/Alexey-Yakovenko/stereo-widener.git' 'makefix.diff')
md5sums=('SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}

prepare() {
        cd "$srcdir/$_gitname"
        patch -p1 < ../makefix.diff
}

build() {
  cd "${srcdir}/$_gitname"
  make
}

package() {
  cd "${srcdir}/$_gitname"

  install -Dm 755 stereo_widener.so "$pkgdir/usr/lib/deadbeef/stereo_widener.so"
}
