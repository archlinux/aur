# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname='sidef'
pkgver='2.35'
pkgrel='1'
pkgdesc="A modern object-oriented programming language."
arch=('any')
url="https://github.com/trizen/sidef"
license=('Artistic2.0')

options=('!emptydirs')
makedepends=()
depends=('perl>=5.22.0' 'perl-data-dump' 'perl-math-gmpq>=0.41' 'perl-math-gmpz>=0.39' 'perl-math-mpfr>=3.29' 'perl-math-mpc' 'perl-math-prime-util-gmp>=0.41')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")

md5sums=('51da9f82b56de8a7c47e28019bbd5903')
sha512sums=('e37d1e581d4efe5f3f234c71a39596609a03a86032141fc85b83231eee20e98402e779d88b101181bd4b4b1280a4120dd1984b93bc3fa8754be575b139396705')

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
