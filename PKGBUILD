# Maintainer: Austin Haedicke <austin.haedicke@gmail.com>
# Telegram @savagezen / @savagezen_aur
# GitHub https://github.com/savagezen/pkgbuild

# Contributor: Jonathon Fernyhough <jonathon@manjaro.org>

pkgname=zef
pkgver=0.8.3
pkgrel=1
pkgdesc="Perl6 Module Management"
arch=('any')
depends=('perl6')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/ugexe/zef"
license=('PerlArtistic')
options=('!purge')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/ugexe/$pkgname/tar.gz/v$pkgver)
sha256sums=('13982fdd9b08b8b3dbe6bdbd9ddd01f919e433313bc431bda3cf1ed5d3bedf19')

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Running tests...'
  PERL6LIB=lib prove -r -e perl6
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing documentation...'
  install -Dm 644 README.pod -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  export RAKUDO_LOG_PRECOMP=1
  export RAKUDO_RERESOLVE_DEPENDENCIES=0
  perl6-install-dist \
    --to="$pkgdir/usr/share/perl6/vendor" \
    --for=vendor \
    --from=.
}
