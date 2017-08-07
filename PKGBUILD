# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-inline-ruby
pkgver=0.1.1
pkgrel=2
pkgdesc="Use Ruby code and libraries in a Perl 6 program"
arch=('i686' 'x86_64')
depends=('perl6' 'ruby')
checkdepends=('perl')
makedepends=('gcc' 'git' 'make' 'perl6-librarymake')
groups=('perl6')
url="https://github.com/awwaiid/p6-Inline-Ruby"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/awwaiid/p6-Inline-Ruby)
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  perl6 configure.pl6
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Running tests...'
  make test
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
