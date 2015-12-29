# Contributor: Yauheni Kirylau <yawghen-gmail-dot-com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Vesa Kaihlavirta
# URL: https://github.com/trollixx/aur-packages
# Upstream: https://projects.archlinux.org/svntogit/community.git/tree/trunk?h=packages/awesome

_pkgname=libui
pkgname=${_pkgname}-git
pkgver=r1878.6a5997c
pkgrel=1
pkgdesc='A portable GUI library for C'
arch=('i686' 'x86_64')
url='https://github.com/andlabs/libui'
license=('MIT')
depends=('gtk3' 'libx11' 'libxcb' 'libffi')
makedepends=('make' 'gcc')
provides=('libui')
conflicts=('libui')
source=("$pkgname::git://github.com/andlabs/libui.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd $pkgname
  make
}

package() {
  install -Dm644 "$srcdir"/$pkgname/ui.h \
    "$pkgdir/usr/include/ui.h"
  install -Dm644 "$srcdir"/$pkgname/out/libui.so \
    "$pkgdir/usr/lib/libui.so"
}
