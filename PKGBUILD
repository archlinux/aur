# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-string-crc32
pkgver=0.04
pkgrel=2
pkgdesc="Simple Perl 6 class to calculate a CRC32 checksum of a string"
arch=('any')
depends=('perl6')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/cosimo/perl6-string-crc32"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/cosimo/perl6-string-crc32)
sha256sums=('SKIP')

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Running tests...'
  PERL6LIB=lib prove -r -e perl6
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing documentation...'
  install -Dm 644 README -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  export RAKUDO_LOG_PRECOMP=1
  export RAKUDO_RERESOLVE_DEPENDENCIES=0
  perl6-install-dist \
    --to="$pkgdir/usr/share/perl6/vendor" \
    --for=vendor \
    --from=.
}
