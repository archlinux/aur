pkgname=bullet3-git
pkgver=r3173.4100db0
pkgrel=1
pkgdesc="A 3D Collision Detection and Rigid Body Dynamics Library for games and animation"
arch=('i686' 'x86_64')
url="http://www.bulletphysics.com/Bullet/"
license=('zlib')
provides=('bullet')
conflicts=('bullet')
depends=()
makedepends=('cmake>=2.6' 'git')
source=('bullet3::git+https://github.com/bulletphysics/bullet3.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/bullet3"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"

  cmake bullet3 \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DBUILD_SHARED_LIBS=ON \
  -DBUILD_BULLET3=ON \
  -DBUILD_BULLET2_DEMOS=OFF \
  -DBUILD_CPU_DEMOS=OFF \
  -DBUILD_UNIT_TESTS=OFF \
  -DINSTALL_LIBS=ON

  make
}

package() {
  cd "$srcdir"
  make DESTDIR="$pkgdir" install
}
