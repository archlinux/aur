# Maintainer: Nathan Burke <dev@bigland.cc>
pkgname=sysmon-tui
_repo=sysmon
pkgver=1.0.0
pkgrel=1
pkgdesc='Live terminal system monitor with an interactive process table'
arch=('x86_64')
url='https://github.com/Lightcode-Dev/sysmon'
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('gcc' 'make')
conflicts=('sysmon' 'sysmon-git')
source=("$_repo-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e5c9d0daa3d2aef23a7b8a3f748330802c27839970ff26f95154248ea0afe52c')

build() {
  cd "$_repo-$pkgver"
  # makepkg exports CFLAGS and LDFLAGS from /etc/makepkg.conf; the Makefile honours them
  make CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS"
}

package() {
  cd "$_repo-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
