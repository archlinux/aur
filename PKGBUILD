# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-glib-object-introspection'
pkgver='0.042'
pkgrel='4'
pkgdesc="Dynamically create Perl language bindings"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glib-perl>=1.32' 'glib2>=2.50.3' 'gobject-introspection-runtime>=1.50.0+1+gb8d92b0' 'libffi>=3.2.1' 'perl-extutils-depends>=0.3' 'perl-extutils-pkgconfig')
makedepends=('gobject-introspection' 'perl-extutils-depends>=0.3' 'perl-extutils-pkgconfig')
url='https://metacpan.org/release/Glib-Object-Introspection'
source=('http://search.cpan.org/CPAN/authors/id/X/XA/XAOC/Glib-Object-Introspection-0.042.tar.gz')
md5sums=('2d40625d5d45ec6ec3da0bddb9ebdc59')
sha512sums=('a91ba7d553187ed0eb6b35bd68c70de40c82d5e42422ec0a370fa77268cc5b81be3b9b76947ceaf78541224bd188ab902f12be7a5e0efaf94638fea39ba57ba0')
_distdir="Glib-Object-Introspection-0.042"

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

_perl_depends() {
# template start; name=perl-binary-module-dependency; version=1;
if [[ $(find "$pkgdir/usr/lib/perl5/" -name "*.so") ]]; then
	_perlver_min=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')
	_perlver_max=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')
	depends+=("perl>=$_perlver_min" "perl<$_perlver_max")
fi
# template end;
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
  _perl_depends
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
