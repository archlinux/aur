pkgname=snacc-basin-git
pkgver=1.3.1_18_g0536f7b
pkgrel=1
pkgdesc="Sample Neufeld ASN.1 to C Compiler"
arch=('i686' 'x86_64' 'mips64el' 'armv6h' 'armv7h' 'arm')
url="http://packages.debian.org/source/sid/snacc"
license=(GPLv2+)
depends=()
makedepends=('git')
provides=(snacc)
conflicts=(snacc)
source=("$pkgname"::"git+https://github.com/basinilya/snacc.git")
md5sums=('SKIP')

build() { 
  cd "${srcdir}/${pkgname}"
  autoreconf -fi
  ./configure --prefix=/usr CFLAGS="$CFLAGS -O0" TCLSH=false
  make
}

package() {
  cd "$srcdir/${pkgname}"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

pkgver() {
  cd "${srcdir}/${pkgname}"
  ./version-gen
}

# vim:set ts=2 sw=2 et:
