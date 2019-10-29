# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
pkgname=nauniq
_dist=App-nauniq
pkgver=0.10
pkgrel=3
pkgdesc="non-adjacent uniq"
license=('GPL' 'PerlArtistic')
url="https://metacpan.org/release/$_dist"
arch=('any')
depends=('perl>=5.10.0')
checkdepends=('perl-file-slurper' 'perl-file-chdir' 'perl-string-shellquote' 'perl-tie-cache')
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/P/PE/PERLANCAR/$_dist-$pkgver.tar.gz")
sha256sums=('8c37c9baf352bf21b876c1fef76b7225e493149e15e1d74defa94047d5a0e934')

build() {
  cd "$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
