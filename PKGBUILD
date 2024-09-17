# Maintainer: Joel Jensen <yobert@gmail.com>
pkgname='perl-io-sendfile'
pkgver='0.01'
pkgrel='1'
pkgdesc="Perl extension that implements the sendfile() interface."
arch=('any')
license=('Artistic-1.0-Perl')
options=('!emptydirs')
depends=('perl')
url='http://search.cpan.org/dist/IO-SendFile'
source=("https://cpan.metacpan.org/authors/id/A/AD/ADDI/IO-SendFile-${pkgver}.tar.gz" inc.patch)
md5sums=('4d656098a01eb6632cc9d073bd1c9eda' '282ca5faeec2039ff05d666d05aa5be6')
sha512sums=('bbd396c2d88e1b07ce0ebd0b78867246a0d676f76c9b547963acdbd314b2e23d4f44a620411c25bbd24e8be7b35964beb56e8955915686ddf2f45312ddf78431' '4688cddb8e8e625e0ba6fe6e3491d4305b674ac5bafff8a22e5b0e1a4e7270a9360b40d0c13db4c84e2261abd25cb77b182fb934f7491feb30f4f2c5c40669c6')
_distdir="IO-SendFile-${pkgver}"

prepare() {
    cd "$_distdir"
    patch -p1 -i "${srcdir}/inc.patch"
}

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd $_distdir
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  make test
}

package() {
  cd "$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
