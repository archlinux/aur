# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=bdsync
pkgver=0.11.1
pkgrel=1
pkgdesc="Fast block device synchronizing tool"
arch=("i686" "x86_64")
url="https://github.com/TargetHolding/bdsync"
license=('GPL')
depends=("openssl")
makedepends=("pandoc")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TargetHolding/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('ee24781c9b063bd9da2c10a82b8c75dee1a813d0472d2dcce2b783a7dd9b55c7')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i -e 's/^CFLAGS=/#CFLAGS=/' Makefile
  sed -i -e 's/\$(CRYPTO_LDFLAGS)$/$(CRYPTO_LDFLAGS) $(LDFLAGS)/' Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 bdsync "$pkgdir/usr/bin/bdsync"
  install -D -m644 bdsync.1 "$pkgdir/usr/share/man/man1/bdsync.1"
}

# vim:set ts=2 sw=2 et:
