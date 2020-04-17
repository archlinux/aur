# Maintainer: Denis Kasak <dkasak|AT|termina.org.uk>
# Contributor: Hilton Medeiros <medeiros.hilton at gmail tod com>
# Contributor: Tony Dodd <arch@recalcitrance.net>
# Contributor: Mark Taylor <skymt0@gmail.com>

pkgname=contextfree
pkgver=3.2
pkgrel=2
pkgdesc="A program that generates images from written instructions called a grammar"
arch=('i686' 'x86_64')
url="https://www.contextfreeart.org/"
license=('GPL2')
depends=('libpng' 'gcc-libs')
makedepends=('bison' 'flex')
source=("https://www.contextfreeart.org/download/ContextFreeSource${pkgver}.tgz")
sha256sums=('d96cee09cee9022f25c0a085d68249df3e1d384017dd069b3a76fe0053ade977')


build() {
  # NOTE: 3.1+ tarball packages files directly in the root of the archive
  # instead of under a directory.
  # cd "$srcdir/context-free-$pkgver"
  cd "$srcdir"

  sed -i 's/c++14/c++17/' Makefile
  make
}

package() {
  # NOTE: Same as above.
  # cd "$srcdir/context-free-$pkgver"
  cd "$srcdir"

  install -Dm755 cfdg "$pkgdir/usr/bin/cfdg"
  install -d "$pkgdir/usr/share/$pkgname"
  cp -r input "$pkgdir/usr/share/$pkgname/examples"
}
