# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=hsxkpasswd
pkgver=3.6
pkgrel=2
pkgdesc="Generate secure, memorable passwords inspired by XKCD and Password Haystacks"
arch=('any')
url="https://www.bartbusschots.ie/s/publications/software/xkpasswd/"
license=('BSD')
depends=('perl' 'perl-clone' 'perl-datetime' 'perl-file-homedir'
         'perl-file-share' 'perl-json' 'perl-list-moreutils' 'perl-math-round'
         'perl-readonly' 'perl-text-unidecode' 'perl-type-tiny')
makedepends=('perl-module-build')
source=("https://github.com/bbusschots/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3dd7b6332bbd1bbb6435c669d83592c94d7c5537a3fb9b6efaf9a3c09f3cd86d')

build() {
  cd "$pkgname-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  perl ./Build.PL
  ./Build
}

check() {
  cd "$pkgname-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  ./Build test
}

package() {
  cd "$pkgname-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --installdirs=vendor --destdir="$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
