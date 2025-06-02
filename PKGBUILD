# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=0xtools-git
pkgver=2.0.3.r88.g6acf5c7
pkgrel=1
pkgdesc="0x.Tools: X-Ray vision for Linux systems"
arch=("x86_64")
url="https://github.com/tanelpoder/0xtools"
license=("GPL-2.0-or-later")
depends=(
  "bash"
  "python"
)
makedepends=(
  "git"
)
conflicts=('0xtools')
source=("git::git+https://github.com/tanelpoder/0xtools")
b2sums=('SKIP')

pkgver() {
  cd "${srcdir}/git"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/git"
  make CFLAGS="$CFLAGS $LDFLAGS" all
}

package() {
  cd "${srcdir}/git"
  make PREFIX="${pkgdir}/usr" install
}
