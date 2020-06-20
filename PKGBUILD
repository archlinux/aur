# Maintainer : <michael dot kogan at gmx dot net>

pkgname='perl-mime-detect'
pkgver='0.10'
pkgrel='1'
pkgdesc="MIME::Detect - MIME file type identification"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.6.0' 'perl-file-sharedir' 'perl-file-sharedir-install' 'perl-moo' 'perl-filter-signatures' 'perl-xml-libxml')
makedepends=()
optdepends=()
url='https://metacpan.org/pod/MIME::Detect'
source=("https://cpan.metacpan.org/authors/id/C/CO/CORION/MIME-Detect-$pkgver.tar.gz")
md5sums=('61a027f7c625e5694ac1e8d1e03d70b3')
_distdir="MIME-Detect-$pkgver"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}