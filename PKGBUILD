# Maintainer: Cyanism <aur at cyan dot slmail dot me>
_reponame="JKPS"
pkgname=jkps-git
pkgver=0.3.r3.g52103f2
pkgrel=1
pkgdesc="Shows keystates, keys per second, total keys and current beats per minute."
arch=('x86_64')
url="https://github.com/JekiTheMonkey/JKPS"
license=('MIT')
groups=()
depends=('sfml')
makedepends=('git' 'cmake')
provides=('jkps')
conflicts=('jkps')
options=('!buildflags')
source=('git+https://github.com/JekiTheMonkey/JKPS.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_reponame"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "$_reponame" \
      -DCMAKE_BUILD_TYPE='None' \
      -DCMAKE_INSTALL_PREFIX='/usr' \
      -Wno-dev
  cmake --build build
}

package() {
  install -Dm755 build/JKPS "$pkgdir/usr/bin/$_reponame"
  install -Dm644 $_reponame/LICENSE "$pkgdir/usr/share/licenses/$_reponame/LICENSE"
}
