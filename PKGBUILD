# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-libgit2
pkgver=0.1
pkgrel=1
pkgdesc="A Perl 6 interface to libgit2"
arch=('any')
depends=('libgit2' 'perl6')
checkdepends=('perl'
              'perl6-file-temp'
              'perl6-test-meta'
              'perl6-test-when')
makedepends=('git')
groups=('perl6')
url="https://github.com/CurtTilmes/perl6-libgit2"
license=('custom')
source=($pkgname-$pkgver::git+https://github.com/CurtTilmes/perl6-libgit2)
sha256sums=('SKIP')

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Running tests...'
  PERL6LIB=lib prove -r -e perl6
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 *.pdf -t "$pkgdir/usr/share/licenses/$pkgname"

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
