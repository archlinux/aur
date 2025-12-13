# Maintainer: foxmakes <pixilreal@gmail.com>
pkgname=servo-spp-git
pkgver=1
pkgrel=1
pkgver() {
  cd "$srcdir/spp"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
pkgdesc="Official semicolon servo++/spp implementation - A C++ implementation of the Servo programming language"
arch=('x86_64')
url="https://github.com/semicolon-servo/spp"
license=('unknown')
depends=('gcc' 'bc')
makedepends=('git' 'make' 'gcc')
provides=('servo-spp' 'servocomp')
conflicts=('servo-spp')
source=("git+https://github.com/semicolon-servo/spp.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/spp"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/spp"
  make
}

package() {
  cd "$srcdir/spp"
  install -Dm755 servocomp "$pkgdir/usr/bin/servo"
  
  if [ -d "reach" ]; then
    install -d "$pkgdir/usr/share/servo/reach"
    cp -r reach/* "$pkgdir/usr/share/servo/reach/"
  fi
  
  if [ -d "globalheaders" ]; then
    install -d "$pkgdir/usr/share/servo/globalheaders"
    cp -r globalheaders/* "$pkgdir/usr/share/servo/globalheaders/"
  fi
}
