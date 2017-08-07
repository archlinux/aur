# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-getopt-std
pkgver=0.0.1
pkgrel=2
pkgdesc="Process single-character options with option clustering"
arch=('any')
depends=('perl6')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/ppentchev/perl6-Getopt-Std"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/ppentchev/perl6-Getopt-Std)
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
