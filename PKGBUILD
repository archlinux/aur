# Maintainer: willemw <willemw12@gmail.com>
# Contributor: totoloco <totoloco at gmail dot com>

pkgname=pmus-git
pkgver=0.42.r401.g318d75a
pkgrel=1
pkgdesc="Practical Music Search is a highly configurable, ncurses-based client for MPD"
arch=('x86_64')
url="https://ambientsound.github.io/pms"
license=('GPL')
# Optional makedepend: 'pandoc: build man page'
makedepends=('cmake' 'git')
depends=('libmpdclient')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::git+https://github.com/ambientsound/pms.git#branch=0.42.x)
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S $pkgname -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
  make -C build
}

package() {
  install -dm755 "$pkgdir/usr/share/pms/examples"
  install -m644 $pkgname/examples/* "$pkgdir/usr/share/pms/examples"
  make -C build DESTDIR="$pkgdir/" install
}

