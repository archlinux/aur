# Maintainer: Victor Polillo Moreira <victorpmoreira [a] gmail.com>
# Maintainer: Philipp Claßen <philipp.classen@posteo.de>

pkgname=space2ctrl-git
_gitname=Space2Ctrl
pkgver=44.4d07080
pkgrel=1
pkgdesc="Turns the spacebar key to another control key"
arch=('i686' 'x86_64')
url="https://github.com/r0adrunner/Space2Ctrl"
license=('MIT')
depends=('libxtst' 'libx11' 'xorg-xmodmap')
makedepends=('git')
conflicts=('space2ctrl')
provides=('space2ctrl')
source=('git://github.com/r0adrunner/Space2Ctrl.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd $_gitname
  make PREFIX=/usr
}

package() {
  cd $_gitname
  make PREFIX=/usr DESTDIR="$pkgdir" install

  # install license
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/$_gitname/LICENSE"

  # No VCS leftovers:
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
