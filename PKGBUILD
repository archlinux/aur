# Maintainer: Daniel Micay <danielmicay@gmail.com>
_gitname=playpen
pkgname=playpen-git
pkgver=11
pkgver() { cd $_gitname && git describe | sed 's/^v//; s/-/./g'; }
pkgrel=1
epoch=1
pkgdesc='A secure application sandbox using namespaces, cgroups and seccomp'
arch=(i686 x86_64)
url='https://github.com/thestinger/playpen/'
license=(MIT)
depends=(libseccomp systemd)
makedepends=(git)
provides=(playpen)
conflicts=(playpen)
source=(git://github.com/thestinger/playpen)
md5sums=(SKIP)

build() {
  cd $_gitname
  make
}

package() {
  cd $_gitname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
