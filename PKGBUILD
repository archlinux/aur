# Maintainer: Justin Davis (juster) <jrcd83@gmail.com>

pkgname=perl-alpm
pkgver=3.03
pkgrel=1
pkgdesc='ArchLinux Package Manager backend library.'
arch=(i686 x86_64)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=(perl)
url=https://metacpan.org/release/ALPM
source=("http://search.cpan.org/CPAN/authors/id/J/JU/JUSTER/ALPM-$pkgver.tar.gz")
_ddir=ALPM-3.03
md5sums=('d6ad3fc10ff9a470db4a4992a3ec7c3a')

build()
(
  cd "$srcdir/$_ddir"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  /usr/bin/perl Makefile.PL
  make
)

check()
(
  cd "$srcdir/$_ddir"
  export PERL_MM_USE_DEFAULT=1
  unset PERL5LIB
  make test
)

package()
(
  cd "$srcdir/$_ddir"
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
)
