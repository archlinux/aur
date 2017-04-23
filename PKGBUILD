# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname='sidef'
pkgver='3.00'
pkgrel='1'
pkgdesc="A modern object-oriented programming language."
arch=('any')
url="https://github.com/trizen/sidef"
license=('Artistic2.0')

options=('!emptydirs')
makedepends=()
depends=('perl>=5.22.0' 'perl-data-dump' 'perl-math-gmpq>=0.45' 'perl-math-gmpz>=0.39' 'perl-math-mpfr>=3.29' 'perl-math-mpc' 'perl-math-prime-util-gmp>=0.44' 'perl-term-readline-gnu')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")

md5sums=('6d72027f90ae684cfc599f372d94fa80')
sha512sums=('ff2a366e94af83ff3d65f762354e9677f0606439def9866a12356095bafba0186b994f6ff8975be2aa9e254ba225b53bb891ae80337f4bf7820ffd00d3dace1d')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                                          \
      PERL_AUTOINSTALL=--skipdeps                                                     \
      PERL_MM_OPT="INSTALLDIRS=vendor INSTALLVENDORSCRIPT=/usr/bin DESTDIR='$pkgdir'"

    cd "$srcdir/$pkgname-$pkgver"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
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
