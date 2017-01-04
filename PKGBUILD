# Maintainer: Kuldeep Singh Dhaka <kuldeep@madresistor.com>

pkgname=box0-utils-git
_pkgname=box0-utils
pkgver=13.dcf52ee
pkgrel=1
pkgdesc="Box0 Shell utilities"
arch=('i686' 'x86_64')
url="https://www.madresistor.com/box0"
license=('GPL')
provides=(box0-utils)
conflicts=(box0-utils)
replaces=(box0-utils)
source=("git+https://gitlab.com/madresistor/$_pkgname.git")
depends=('libbox0' 'readline')
makedepends=('cmake' 'git')
md5sums=('SKIP')


pkgver() {
  cd "$srcdir/$_pkgname"
  echo "$(git rev-list --count HEAD).$(git describe --always )"
}

prepare() {
  cd "$srcdir/$_pkgname"
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd "$srcdir/$_pkgname/build"
  # We are not building demo examples as they will not be installed
  cmake -DCMAKE_INSTALL_PREFIX='/usr' ..
  make
}

package() {
  make -C "$srcdir/$_pkgname/build" DESTDIR="${pkgdir}" install
}
