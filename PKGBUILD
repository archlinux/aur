# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-inline-scheme-guile
pkgver=0.1
pkgrel=2
pkgdesc="Use Guile Scheme code and libraries in your Perl 6 code"
arch=('i686' 'x86_64')
depends=('guile' 'perl6')
checkdepends=('perl')
makedepends=('git' 'perl6-librarymake' 'pkg-config')
groups=('perl6')
url="https://github.com/drforr/perl6-Inline-Scheme-Guile"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/drforr/perl6-Inline-Scheme-Guile)
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  ./configure.pl6
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Running tests...'
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
