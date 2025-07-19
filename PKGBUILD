# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-xml-xpathengine'
pkgver='0.14.20161119'
_commit=73b8c1cceaa98b373ed9dfd0040e9fa577eba0bf
pkgrel='3'
pkgdesc="a re-usable XPath engine for DOM-like trees"
arch=('any')
license=('Artistic-1.0-Perl')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
checkdepends=('perl-pod-coverage'
              'perl-test-pod'
              'perl-test-pod-coverage')
url='https://metacpan.org/release/XML-XPathEngine'
source=("${pkgname}-${_commit}.tar.gz::https://github.com/mirod/XML--XPathEngine/archive/${_commit}.tar.gz"
        fix-bareword-Step-constants.patch
        fix-findnodes-as-string-test.patch)
md5sums=('9947ee80912a89b920e6f78ee29ecd6e'
         '0feb9bb13f12befffd3842cf3570f94b'
         '3aae107d59a6316b6f2feed8ad88cca9')
sha512sums=('44b27e67514eaf69b25b768f9b30c38c7bce3983bea63db1e4c5f97bb83249bffe9549ed3bf0b1a5d2ffe6eacbb874e91352df8c5fe9b6cb56e3e889a8c094b1'
            '378735a9743e1f0e20bbca8032eadb120d0a679516f2077a84ab9ed1b0048bf5f9e33b073d3097acad489aca2338dbb18d28bbccf00657457e9dcf9c3656244f'
            'a3d6f5ced8db0362324e7c6c4367ab161ea5e30c635e97241f61142459f1be6a5a1c0af3e9c5569aaee0efac24ea8a883fe8b3b012e8c3371bbbf6b7b53208b6')
_distdir="XML--XPathEngine-${_commit}"

prepare() {
  patch -d "$srcdir/$_distdir" -Np1 -i ../fix-bareword-Step-constants.patch # Debian patch --> https://rt.cpan.org/Public/Bug/Display.html?id=123987
  patch -d "$srcdir/$_distdir" -Np1 -i ../fix-findnodes-as-string-test.patch # Fix broken test --> https://github.com/mirod/XML--XPathEngine/commit/b89751b983077b1b1c8059b94471cfe5f5da3aa8
}

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

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
