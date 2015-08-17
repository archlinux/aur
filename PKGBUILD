_gitname=replicode
pkgname=$_gitname-git
pkgver=r582.7b38710
pkgrel=1
pkgdesc="Constructivist AI language and runtime"
url="http://wiki.humanobs.org/public:replicode:replicode-main"
arch=('i686' 'x86_64')
license=('Custom')
depends=('glibc')
makedepends=('git')
source=("git+https://github.com/sandsmark/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd 'replicode'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build
}

build() {
  cd build
  cmake ../$_gitname -DCMAKE_INSTALL_PREFIX=/usr
  make VERBOSE=1
}

check() {
  cd build
  make test
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
