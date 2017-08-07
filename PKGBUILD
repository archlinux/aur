# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-digest-md5
pkgver=0.05
pkgrel=2
pkgdesc="An interface-compatible port of Perl 5 Digest::MD5 to Perl 6"
arch=('any')
depends=('perl6')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/cosimo/perl6-digest-md5"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/cosimo/perl6-digest-md5)
sha256sums=('SKIP')

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Running tests...'
  PERL6LIB=lib prove -r -e perl6
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  export RAKUDO_LOG_PRECOMP=1
  export RAKUDO_RERESOLVE_DEPENDENCIES=0
  perl6-install-dist \
    --to="$pkgdir/usr/share/perl6/vendor" \
    --for=vendor \
    --from=.
}
