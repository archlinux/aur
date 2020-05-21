# Maintainer: Phosphenius <luca dot kredel at web dot de>
pkgname=sp9k-git
_pkgname=sp9k
pkgver=0.1.1.r0.ge9ad893
pkgrel=1
pkgdesc="A bullet hell/space shooter game made in C++ and SFML as a learning project."
arch=('x86_64')
url="https://github.com/Phosphenius/sp9k"
license=('MIT')
depends=('sfml>=2.5.1')
conflicts=(sp9k)
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_pkgname"

  make ASSETDIR=/usr/share/"$_pkgname" release
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir" PREFIX=/usr install
}
