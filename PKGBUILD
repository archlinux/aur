# Maintainer: Jonathan Hudson <jh+mwptools@daria.co.uk>
pkgname=blackbox-tools-inav-git
pkgver=r240.edbf99a
pkgrel=1
pkgdesc='tools for examining INAV blackbox logs - master'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64' 'riscv64')
url='https://github.com/iNavflight/blackbox-tools.git'
license=('GPL-3.0-only')
makedepends=('git')
depends=('cairo')
provides=("blackbox-tools-inav")
conflicts=("blackbox-tools-git" )
source=("blackbox-tools::git+$url")
sha512sums=('SKIP')
_basedir="blackbox-tools"

pkgver() {
  cd $_basedir
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_basedir
  make
}

package() {
  # executable
   cd $_basedir
   install -Dm755 obj/blackbox_decode "$pkgdir/usr/bin/blackbox_decode"
   install -Dm755 obj/blackbox_render "$pkgdir/usr/bin/blackbox_render"
   install -Dm755 obj/encoder_testbed "$pkgdir/usr/bin/encoder_testbed"
   install -Dm644 tools/blackbox_decode_complete.sh $pkgdir/usr/share/bash-completion/completions/blackbox_decode
}
