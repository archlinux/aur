# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-digest-sha1-native
pkgver=0.02
pkgrel=1
pkgdesc="SHA1 in Perl 6 using NativeCall"
arch=('any')
depends=('perl6')
checkdepends=('perl')
makedepends=('git' 'make' 'perl6-librarymake')
groups=('perl6')
url="https://github.com/bduggan/p6-digest-sha1-native"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/bduggan/p6-digest-sha1-native)
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  perl6 Configure.pl6
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
