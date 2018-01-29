# Maintainer: Zach <mikezackles @ gmail . com>
# Contributor: Tomáš Mládek <tmladek @ inventati doth ork>
# Contributor: shuall <shualloret @ gmail . com>

pkgname=chaiscript-git
pkgver=6.0.0.r101.g0c32c50
pkgrel=1
pkgdesc="Embedded scripting language designed from the ground up to directly target C++"
arch=('any')
depends=('ncurses')
makedepends=('cmake')
url="http://www.chaiscript.com"
license=('BSD')
source=("$pkgname::git+https://github.com/Chaiscript/Chaiscript.git")
sha256sums=('SKIP')
provides=('chaiscript')
conflicts=('chaiscript')
install=${pkgname}.install

pkgver() {
  cd "$pkgname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"

  msg 'Building...'
  cmake -DCMAKE_INSTALL_PREFIX=/usr ./
  make
}

package() {
  cd "$pkgname"

  msg 'Installing...'
  make DESTDIR="$pkgdir" install
  install -D -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
