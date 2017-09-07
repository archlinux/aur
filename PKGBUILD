# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=cro
pkgver=0.7
pkgrel=1
pkgdesc="Libraries for building reactive services in Perl6"
arch=('any')
depends=('perl6'
         'perl6-cro-websocket'
         'perl6-file-find'
         'perl6-io-socket-async-ssl'
         'perl6-json-fast'
         'perl6-meta6'
         'perl6-oo-monitors'
         'perl6-shell-command'
         'perl6-terminal-ansicolor'
         'perl6-yamlish')
checkdepends=('perl')
makedepends=('git')
groups=('croservices' 'perl6')
url="https://github.com/croservices/cro"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/croservices/cro)
sha256sums=('SKIP')

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
  cp -dpr --no-preserve=ownership docs "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  export RAKUDO_LOG_PRECOMP=1
  export RAKUDO_RERESOLVE_DEPENDENCIES=0
  perl6-install-dist \
    --to="$pkgdir/usr/share/perl6/vendor" \
    --for=vendor \
    --from=.
}
