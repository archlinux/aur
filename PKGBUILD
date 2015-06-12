pkgname=perl-data-dumper-simple
pkgver=0.110.0
pkgrel=1
pkgdesc="Easily dump variables with names"
arch=('any')
url="http://search.cpan.org/dist/Data-Dumper-Simple/"
license=('perl')
depends=('perl-filter-simple')
options=(!emptydirs)
source=('http://search.cpan.org/CPAN/authors/id/O/OV/OVID/Data-Dumper-Simple-0.11.tar.gz')
md5sums=('0a3e67bf5bb6f2f39116bb92632631df')

build() {
  _dir=$(find $srcdir -maxdepth 2 -type f -name 'Makefile.PL')
  if [ ! -z "$_dir" ]; then
    cd $(dirname "$_dir")
    PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
    make 
    make install DESTDIR="${pkgdir}"

  else
  _dir=$(find $srcdir -maxdepth 2 -type f -name 'Build.PL')
  if [ ! -z "$_dir" ]; then
    cd $(dirname "$_dir")
    PERL_MM_USE_DEFAULT=1 perl Build.PL INSTALLDIRS=vendor
    ./Build 
    ./Build install destdir=${pkgdir}

  else
    echo "error: failed to detect build method for $pkgname"
    echo "you may be able to fix this by editing the PKGBUILD"
    return 1
  fi fi

  # remove perllocal.pod and .packlist
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
