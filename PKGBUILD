pkgname=timerun-git
_pkgname=timerun
pkgver=1.0.0.r7.g7deb602
pkgrel=1
pkgdesc="High-performance dynamic POSIX time-interception & diagnostics suite for Linux"
arch=('x86_64')
url="https://github.com/AndresDev859674/timerun"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('git' 'gcc' 'make')
provides=('timerun' 'timeeye')
conflicts=('timerun' 'timeeye')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  make CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS"
}

package() {
  cd "$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
