# Maintainer: Nathan Burke <dev@bigland.cc>
pkgname=sysmon-tui
_repo=sysmon
pkgver=1.2.0
pkgrel=1
pkgdesc='Live terminal system monitor written in pure C'
arch=('x86_64')
url='https://github.com/Lightcode-Dev/sysmon'
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('gcc' 'make')
conflicts=('sysmon' 'sysmon-git')
source=("$_repo-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4bc3f15f858a7b6ccc99238c157d017ca48cc47906fc2e20f36ea1e9b896363c')

build() {
  cd "$_repo-$pkgver"
  # makepkg exports CFLAGS and LDFLAGS from /etc/makepkg.conf; the Makefile honours them
  make CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS"
}

package() {
  cd "$_repo-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
