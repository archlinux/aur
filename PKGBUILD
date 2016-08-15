# Maintainer: Sebastian Morr <sebastian@morr.cc>

pkgname=bucklespring-git
_gitname=bucklespring
pkgver=20160815
pkgrel=1
pkgdesc="Nostalgia bucklespring keyboard sound, sampled from IBM's Model-M"
arch=('i686' 'x86_64')
url="http://github.com/zevv/bucklespring"
license=('MIT')
depends=('openal' 'alure' 'libxtst')
makedepends=('git')
source=('git+https://github.com/zevv/bucklespring' change-default-wav-path.patch)
sha1sums=('SKIP' '3658e6878ce662cafbb56aa1497aa102da37d27e')

prepare() {
  cd "$srcdir/$_gitname"
  patch -p1 <../change-default-wav-path.patch
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "$pkgdir"/usr/bin
  cp buckle "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/bucklespring
  cp wav/* "$pkgdir"/usr/share/bucklespring
}
