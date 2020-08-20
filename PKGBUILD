# Maintainer: Stanislaw Grams <sjg@fmdx.pl>

pkgname=mtscan-git
pkgver=20200820
pkgrel=1
pkgdesc="Mikrotik RouterOS wireless scanner"
arch=('x86_64')
url="https://github.com/kkonradpl/mtscan"
license=('GPL2')
depends=('curl' 'openssl' 'zlib' 'yajl' 'libssh' 'gtk2')
provides=('mtscan')
conflicts=('mtscan')
makedepends=('git' 'cmake' 'ninja' 'pkgconf' 'curl' 'openssl' 'zlib' 'yajl' 'libssh' 'gtk2')
source=("git+https://github.com/kkonradpl/mtscan")
md5sums=('SKIP')
_gitname="mtscan"

pkgver() {
  cd "$srcdir/$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd "$srcdir/$_gitname/build"
  cmake .. -GNinja -Wall -DCMAKE_INSTALL_PREFIX='/usr'
  ninja
}

package() {
  cd "$srcdir/$_gitname/build"
  DESTDIR="$pkgdir" ninja install
}
