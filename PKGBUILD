# Maintainer: Kuldeep Singh Dhaka <kuldeepdhaka9@gmail.com>

pkgname=lmfit-git
_pkgname=lmfit
pkgver=269.822d724
pkgrel=1
pkgdesc="Self-contained C library for Levenberg-Marquardt least-squares minimization and curve fitting."
arch=('i686' 'x86_64')
url="http://apps.jcns.fz-juelich.de/doku/sc/$_pkgname"
license=('FreeBSD')
provides=(lmfit)
conflicts=(lmfit)
replaces=(lmfit)
source=("git://apps.jcns.fz-juelich.de/$_pkgname")
depends=()
makedepends=('git')
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
  cd "$srcdir/$_pkgname"
  # http://askubuntu.com/a/27679
  libtoolize --force
  aclocal
  autoheader
  automake --force-missing --add-missing
  autoconf

  cd "build"
  ../configure --prefix=/usr
  make
}

package() {
  make -C "$srcdir/$_pkgname/build" DESTDIR="${pkgdir}" install
}
