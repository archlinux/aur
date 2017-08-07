# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-file-temp
pkgver=0.0.5
pkgrel=2
pkgdesc="Create temporary files"
arch=('any')
depends=('perl6' 'perl6-file-directory-tree')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/perlpilot/p6-File-Temp"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/perlpilot/p6-File-Temp)
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
