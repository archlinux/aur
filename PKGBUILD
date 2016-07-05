# Maintainer: Ruben Kelevra <ruben@vfn-nrw.de>

pkgname=perl-class-returnvalue
pkgver=0.55
pkgrel=1
pkgdesc="A smart return value object"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Class-ReturnValue/"
license=('PerlArtistic' 'GPL')
source=('http://search.cpan.org/CPAN/authors/id/J/JE/JESSE/Class-ReturnValue-0.55.tar.gz')
md5sums=('047fbbcfd90d5c399a1feba55781329e')
sha256sums=('ed3836885d78f734ccd7a98550ec422a616df7c31310c1b7b1f6459f5fb0e4bd')
depends=('perl-devel-stacktrace' )
options=(!emptydirs)

build() {
  _dir=$(find $srcdir -maxdepth 2 -type f -name 'Makefile.PL')
  if [ ! -z "$_dir" ]; then
    cd $(dirname "$_dir")
    PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
    make  || return 1
    make install DESTDIR="${pkgdir}" || return 1

  else
  _dir=$(find $srcdir -maxdepth 2 -type f -name 'Build.PL')
  if [ ! -z "$_dir" ]; then
    cd $(dirname "$_dir")
    PERL_MM_USE_DEFAULT=1 perl Build.PL INSTALLDIRS=vendor || return 1
    ./Build  || return 1
    ./Build install destdir=${pkgdir} || return 1

  else
    echo "error: failed to detect build method for $pkgname"
    echo "you may be able to fix this by editing the PKGBUILD"
    return 1
  fi fi

  # remove perllocal.pod and .packlist
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}


