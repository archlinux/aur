# Maintainer: Jan Horvath <johnvonbrno at tutamail dot com>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=liboakleaf
pkgver=1.0.1
pkgrel=1
pkgdesc="Library which implements robust statistical estimates"
arch=('x86_64')
url="https://integral.physics.muni.cz/oakleaf"
license=(LGPL-3.0-only)
depends=(
  gcc-libs
  glibc
  libminpack
)
makedepends=(gcc-fortran)

source=("https://integral.physics.muni.cz/ftp/oakleaf/oakleaf-$pkgver.tar.gz"{,.asc})
validpgpkeys=('50329FD7732E2AB08161435F1E625DF64972FF9A')

md5sums=("af752a5d682ecb4dd8c18500d69b64a8"
	"SKIP")
INTEGRITY_CHECK=('md5')

_archive="oakleaf-$pkgver"

FCFLAGS="-O2 -ffpe-summary=invalid,zero,overflow -fno-unsafe-math-optimizations -frounding-math -fsignaling-nans"

build() {
  cd "$_archive"

  ./configure --prefix=/usr --libexecdir=/usr/lib
  make
}

check() {
  cd "$_archive"
  make -k check
}

package() {
  cd "$_archive"

  make DESTDIR="$pkgdir/" install
}
