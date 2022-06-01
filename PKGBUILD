# Maintainer : András Wacha <awacha@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-nvidia-ml-pl'
pkgver='4.304.2'
pkgrel='4'
pkgdesc="Perl bindings to the NVIDIA Management Library NVML"
arch=('x86_64' 'i686')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.32' 'nvidia-utils>=430.34')
makedepends=()
url='https://metacpan.org/release/nvidia-ml-pl'
source=('http://search.cpan.org/CPAN/authors/id/N/NV/NVBINDING/nvidia-ml-pl-4.304.2.tar.gz')
md5sums=('31aa509016401e3b4c74e184663f9acf')
sha512sums=('41a6f2198d37b829361adb7ca568dd0b023cb56e78b1f1c88a9ed72b2119d607e7495153663aa620ab6889635830722634b6ea1549f852f99e8f0e9ebf497e01')
_distdir="nvidia-ml"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    sed -i 's+#undef bool+/*#undef bool*/+g' nvml_wrap.c
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

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
