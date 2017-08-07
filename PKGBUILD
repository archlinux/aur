# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-ncurses
pkgver=0.0.1
pkgrel=2
pkgdesc="Perl 6 interface to NCurses library"
arch=('any')
depends=('ncurses' 'perl6')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/azawawi/perl6-ncurses"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/azawawi/perl6-ncurses)
sha256sums=('SKIP')

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Running tests...'
  export PERL6_NCURSES_LIB="libncursesw.so.6"
  PERL6LIB=lib prove -r -e perl6
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

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
