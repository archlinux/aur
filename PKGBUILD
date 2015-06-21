# Maintainer: mojangsta <mojangsta at archlinux bbs>
pkgname=pipexec-git
_pkgname=pipexec
pkgver=2.5.2.g05abf3c
pkgrel=1
pkgdesc="Handling pipe of commands like a single command"
arch=('any')
url="http://github.com/flonatel/pipexec"
license=('GPL2')
depends=()
makedepends=('git')
provides=('pipexec')
source=(git://github.com/flonatel/pipexec.git)
md5sums=(SKIP)

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed -r 's/-.*-/-/' | sed 's/-/./'
}

build() {
  cd "$_pkgname"
# deprecated macros fuck up our build thanks to -Werror
# PKGBUILD:23:21: notice: pardon my french [-Wno-swearing]
  sed -i 's/_BSD_SOURCE/_DEFAULT_SOURCE/' src/pipexec.c
  ./build/init_autotools.sh
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
}

