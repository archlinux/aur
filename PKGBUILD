# Contributor: Quentin Stievenart <quentin.stievenart@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mk-configure
pkgver=0.36.0
pkgrel=1
pkgdesc="Lightweight replacement for GNU autotools"
arch=('any')
makedepends=('bmake' 'bmkdep')
url="https://github.com/cheusov/mk-configure"
license=('BSD')
depends=('bash' 'gawk')
source=("https://github.com/cheusov/$pkgname/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('48188e9305b7b1e2f81d3a70e0af1112affa8a7871b01335b86829ffed746177')

build() {
  cd $pkgname-$pkgname-$pkgver
  export USE_AWK=/usr/bin/gawk
  export USE_INSTALL=/usr/bin/install
  export PREFIX=/usr SYSCONFDIR=/etc MANDIR=/usr/share/man LIBEXECDIR=/usr/lib
  bmake CUSTOM.prog_nbmkdep=/usr/bin/bmkdep all
}

package() {
  cd $pkgname-$pkgname-$pkgver
  export PREFIX=/usr SYSCONFDIR=/etc MANDIR=/usr/share/man LIBEXECDIR=/usr/lib
  bmake CUSTOM.prog_nbmkdep=/usr/bin/bmkdep DESTDIR="$pkgdir" install
  install -Dm644 doc/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENCE
}
