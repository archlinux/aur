# Maintainer: Jonathan Hudson <jh+mwptools@daria.co.uk>

_pkgname=blackbox-tools
pkgname=blackbox-tools-git
pkgver=r65.f49c110
pkgrel=1
pkgdesc='tools for examining blackbox logs'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'pentium4')
url='https://github.com/cleanflight/blackbox-tools.git'
license=('GPLv3')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  make
}

package() {
  # executable
   cd $_pkgname
   install -Dm755 obj/blackbox_decode "$pkgdir/usr/bin/blackbox_decode"
   install -Dm755 obj/blackbox_render "$pkgdir/usr/bin/blackbox_render"
   install -Dm755 obj/encoder_testbed "$pkgdir/usr/bin/encoder_testbed"
}
