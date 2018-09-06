# Maintainer: Robin Appelman <robin@icewind.nl>
pkgname=rapl-read-ryzen-git
pkgver=r5.30636f0
pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
pkgrel=1
pkgdesc="Quick & dirty hack to read AMD Ryzen rapl counters"
arch=('any')
url="https://github.com/djselbeck/rapl-read-ryzen"
license=('GPL')
groups=()
depends=()
makedepends=("git")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://github.com/djselbeck/rapl-read-ryzen")
noextract=()

build() {
  cd $pkgname/
  gcc -o rapl ryzen.c -lm
}

package() {
  cd $pkgname/
  install -D -m755 "rapl" "$pkgdir/usr/bin/rapl"
}

md5sums=('SKIP')
