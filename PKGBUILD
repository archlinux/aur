# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

_pkgname=sidef
pkgname=sidef-git
pkgver=2.35
pkgrel=1
pkgdesc="A modern object-oriented programming language. (-git version)"
arch=('any')
url="https://github.com/trizen/sidef"
license=('Artistic2.0')

provides=('sidef')
conflicts=('sidef')

options=('!emptydirs')
makedepends=('git')
depends=('perl>=5.22.0' 'perl-data-dump' 'perl-math-gmpq>=0.41' 'perl-math-gmpz>=0.39' 'perl-math-mpfr>=3.29' 'perl-math-mpc' 'perl-math-prime-util-gmp>=0.41')

source=('git://github.com/trizen/sidef.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --always | sed -e 's|-|.|g'
}

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                                          \
      PERL_AUTOINSTALL=--skipdeps                                                     \
      PERL_MM_OPT="INSTALLDIRS=vendor INSTALLVENDORSCRIPT=/usr/bin DESTDIR='$pkgdir'"

    cd "$srcdir/$_pkgname"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_pkgname"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_pkgname"
  make install

  #cd "share/sidef"
  #for i in *
  #do
  #    install -Dm644 "$i" "$pkgdir/usr/share/$pkgname/$i"
  #done

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
