# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=cc65
pkgver=2.16
pkgrel=1
pkgdesc='C compiler for 6502 family microprocessors'
makedepends=('linuxdoc-tools')
arch=('i686' 'x86_64')
license=('BSD')
url='https://cc65.github.io/cc65/'
source=(https://github.com/cc65/cc65/archive/V${pkgver}.tar.gz cc65.sh)
sha512sums=('89c61bd2655a466d619cf40f31f65d10e7cead24c04f548c969a79e0a946db239a4fee925708b0621dbdadf4ab1bdb67719c709edd8b989a218f7dc2270862f9'
            'b6304fd3c14955ee14eb1d041f78c933fbd07760cf560f1c9018c0020c466fb754660404d3c59e903668a07c38001eac273a15a883f1fc0eec126cc9b40733b0')

build() {
  cd "$pkgname-$pkgver"

  make
  make doc
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" prefix=/usr install
  install -Dm644 "../cc65.sh" "$pkgdir/etc/profile.d/cc65.sh"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/license"
}
