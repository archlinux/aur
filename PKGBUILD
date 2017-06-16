# Maintainer: Charlie Wolf <charlie@wolf.is>

_pkgname=resolvconf-override
pkgname=${_pkgname}-git
pkgver=r9.798ca21
pkgrel=1
pkgdesc="Override resolv.conf using LD_PRELOAD"
url="https://github.com/hadess/${_pkgname}"
arch=("i686" "x86_64")
source=("git+https://github.com/hadess/${_pkgname}.git")
sha256sums=('SKIP')
depends=("glibc")
makedepends=("autoconf")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/${_pkgname}/
  autoreconf -f -i
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/${_pkgname}/
  make DESTDIR="$pkgdir/" install
}

