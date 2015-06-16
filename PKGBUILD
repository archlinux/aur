pkgname=libepoxy-git
_name=libepoxy
pkgver=1.2.25.r229.ga2a5190
pkgrel=1
pkgdesc="Epoxy is a library for handling OpenGL function pointer management for you"
url="https://github.com/anholt/libepoxy"
arch=('i686' 'x86_64')
license=('BSD')
depends=() # ???
makedepends=("xorg-util-macros" "libx11" "python" "git")
provides=("libepoxy")
conflicts=("libepoxy")
options=('!libtool')
source=("git+https://github.com/anholt/libepoxy.git")

pkgver() {
  cd $_name
  #echo $(git rev-list --count HEAD).$(git describe --tags --long | tr -d v | tr - .)
  echo $(git describe --long --tags | cut -d 'g' -f1)r$(git rev-list HEAD --count).g$(git describe --always) | tr -d v | tr - .
}

build() {
  #  export CFLAGS="-Og -ggdb"
  #  export CXXFLAGS="-Og -ggdb"
  cd "$_name"

    ./autogen.sh --prefix=/usr
    #./configure --prefix=/usr
}

#check() {
#  cd "$_name"
#  make -k check
#}

package() {
  cd "$_name"
  make DESTDIR="$pkgdir" install
}

md5sums=('SKIP')
