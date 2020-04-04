# Maintainer: Swift Geek

pkgname=flashmap-git
_pkgname=${pkgname%-*}
pkgver=a
pkgrel=1
pkgdesc="ChromiumOS flashmap"
arch=('x86_64' 'armv7h')
url="https://chromium.googlesource.com/chromiumos/third_party/flashmap/"
license=('GPL2')
depends=('glibc')
makedepends=('git')
source=("git+https://chromium.googlesource.com/chromiumos/third_party/flashmap/")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  sed -i 's#$(prefix)/sbin#$(prefix)/bin#' Makefile
}

build() {
  cd "$srcdir/${_pkgname}/"
  make
}

package() {
  cd "$srcdir/${_pkgname}/"
  make DESTDIR="${pkgdir}" install
}
