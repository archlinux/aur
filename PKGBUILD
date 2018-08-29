# Maintainer: David Herrmann <dh.herrmann@gmail.com>

_pkgorg=efi-util
_pkgname=efi-devel
pkgdesc='UEFI Development Utilities'
pkgver=r6.2d337c5
pkgrel=1

pkgname=$_pkgname-git
arch=('i686' 'x86_64')
url="https://github.com/$_pkgorg/$_pkgname"
license=('Apache')
depends=('bash')
makedepends=('git' 'meson')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+https://github.com/$_pkgorg/$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  rm -Rf build
  mkdir build
  cd $pkgname
}

build() {
  cd build
  arch-meson ../$pkgname
  ninja
}

check() {
  cd build
  meson test
}

package() {
  cd build
  DESTDIR="$pkgdir" ninja install
}

# vim:set sw=2 et:
