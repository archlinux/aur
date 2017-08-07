# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-compress-brotli
pkgver=0.1.0
pkgrel=2
pkgdesc="Perl6 support for Brotli Encoding"
arch=('i686' 'x86_64')
depends=('perl6')
checkdepends=('perl')
makedepends=('autoconf'
             'automake'
             'gcc'
             'git'
             'libtool'
             'make'
             'perl6-librarymake')
groups=('perl6')
url="https://github.com/sylvarant/Compress-Brotli"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/sylvarant/Compress-Brotli)
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  cd stub && make
}

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
