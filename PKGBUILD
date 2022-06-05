# Maintainer: Jonathan Hudson <jh+mwptools@daria.co.uk>
_pkgname=blackbox-tools
pkgname=blackbox-tools-inav
pkgver=r187.5b29d9f
pkgrel=1
pkgdesc='tools for examining INAV blackbox logs'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/iNavflight/blackbox-tools.git'
license=('GPL3')
makedepends=('git')
depends=('cairo')
provides=("$_pkgname")
conflicts=("blackbox-tools-git" )
source=("blackbox-tools::git+$url")
sha512sums=('SKIP')
_bbversion="5.0.0-rc2"

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  make BLACKBOX_VERSION=$_bbversion
}

package() {
  # executable
   cd $_pkgname
   install -Dm755 obj/blackbox_decode "$pkgdir/usr/bin/blackbox_decode"
   install -Dm755 obj/blackbox_render "$pkgdir/usr/bin/blackbox_render"
   install -Dm755 obj/encoder_testbed "$pkgdir/usr/bin/encoder_testbed"
}
