# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=tsschecker-git
pkgver=r177.3ec5811
pkgrel=1
pkgdesc="a powerfull tool to check tss signing status of various [Apple] devices and firmwares"
arch=(i686 x86_64)
url="https://github.com/tihmstar/tsschecker"
license=('LGPL3')
groups=()
depends=(libfragmentzip-git libirecovery-git libplist-git curl)
makedepends=('git')
provides=(tsschecker)
conflicts=(tsschecker)
source=("git://github.com/tihmstar/tsschecker")
md5sums=('SKIP')

function pkgver() {
  cd tsschecker

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd tsschecker

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd tsschecker

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
