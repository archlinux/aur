# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-nativecall-typediag
pkgver=0.0.1
pkgrel=2
pkgdesc="A module to look at your nativecall types, like class A is repr('CStruct')"
arch=('any')
depends=('perl6' 'perl6-file-temp')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/Skarsnik/nativecall-typediag"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/Skarsnik/nativecall-typediag)
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
