# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>
pkgname=makeppkg-git
_pkgname=makeppkg
pkgver=r42.a22848e
pkgrel=1
makedepends=('rust' 'cargo' 'gcc-libs')
arch=('i686' 'x86_64')
pkgdesc="wrapper for Arch Linux's makepkg, patches source before packages are built"
url="https://github.com/ibrokemypie/makeppkg"
license=('Apache-2.0')
source=('git+http://github.com/ibrokemypie/makeppkg/')
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  cargo build --release
}

package() {
  cd "${_pkgname}"
  install -Dm755 target/release/$_pkgname "$pkgdir/usr/bin/$_pkgname"
}
