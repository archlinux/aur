# Maintainer: Kuldeep Singh Dhaka <kuldeep@madresistor.com>

pkgname=lmfit-git
_pkgname=lmfit
pkgver=396.e71e485
pkgrel=1
pkgdesc="Self-contained C library for Levenberg-Marquardt least-squares minimization and curve fitting."
arch=('i686' 'x86_64')
url="https://jugit.fz-juelich.de/mlz/$_pkgname"
license=('FreeBSD')
provides=(lmfit)
conflicts=(lmfit)
replaces=(lmfit)
source=("git+https://jugit.fz-juelich.de/mlz/$_pkgname.git")
depends=()
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
  cmake \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DBUILD_SHARED_LIBS='TRUE' ..
  make
}

package() {
  make -C "$srcdir/$_pkgname/build" DESTDIR="${pkgdir}" install
}
