# Maintainer: Tomáš Mládek <tmladek @ inventati doth ork>
# Contributor: shuall <shualloret @ gmail . com>

pkgname=chaiscript
pkgver=6.0.0
pkgrel=1
pkgdesc="Embedded scripting language designed from the ground up to directly target C++"
arch=('any')
depends=('ncurses')
makedepends=('cmake')
url="http://www.chaiscript.com"
license=('BSD')
source=(https://github.com/Chaiscript/Chaiscript/archive/v${pkgver}.tar.gz)
sha256sums=('ec4b51e30afbc5133675662882c59417a36aa607556ede7ca4736fab2b28c026')
provides=('chaiscript')
install=${pkgname}.install

build() {
  cd ChaiScript-${pkgver}

  msg 'Building...'
  cmake -DCMAKE_INSTALL_PREFIX=/usr ./
  make
}

package() {
  cd ChaiScript-${pkgver}

  msg 'Installing...'
  make DESTDIR="$pkgdir" install
  install -D -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
