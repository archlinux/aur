# Maintainer: DiedByDisgust <sergio.cabrerafalcon@gmail.com>
pkgname=netswine-git
_pkgname=netswine
pkgver=alpha0.r2.gf8215e8
pkgrel=1
pkgdesc="a small network data metric tool that runs as a daemon. Collects network traffic data, then groups it by process, so can be analized later. GIT version"
arch=("x86_64")
url="https://github.com/DiedByDisgust/netswine"
license=("GPLv2")
depends=("nethogs-git" "ncurses" "sqlite3")
makedepends=("git")
provides=("netswine=${pkgver}")
conflicts=("netswine-git")
source=("netswine::git+https://github.com/DiedByDisgust/netswine#branch=main")
md5sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  git describe --tags  | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  unset CXXFLAGS
  make
}

package() {
  cd "$_pkgname"
  make prefix="/usr" DESTDIR="$pkgdir" install
}

