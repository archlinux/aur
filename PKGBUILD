# Maintainer: Holger Schramm <dev@strace.it>
# Contributor: Austin Haedicke <austin.haedicke@gmail.com>
# Contributor: Jonathon Fernyhough <jonathon@manjaro.org>

pkgname=zef
pkgver=0.13.4
pkgrel=1
pkgdesc="Rakudo (Perl6) Module Management"
arch=('any')
depends=('perl6')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/ugexe/zef"
license=('PerlArtistic')
options=('!purge')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/ugexe/$pkgname/tar.gz/v$pkgver)
sha256sums=('4c594e5fcb4ac02907f5f4db1738814e1e234cfbc6925a57f6c3137c2937d7f2')

check() {
  cd "$srcdir/$pkgname-$pkgver"

  printf 'Running tests...\n'
  PERL6LIB=lib prove -r -e perl6
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  printf 'Installing documentation...\n'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 755 bin/zef -t "$pkgdir/usr/bin"

  printf 'Installing...\n'
  export RAKUDO_LOG_PRECOMP=1
  export RAKUDO_RERESOLVE_DEPENDENCIES=0
  perl6-install-dist \
    --to="$pkgdir/usr/share/perl6/vendor" \
    --for=vendor \
    --from=.
}
