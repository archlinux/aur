# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-prime-util'
pkgver='0.73.git'
pkgrel='1'
pkgdesc="Math::Prime::Util - utilities related to prime numbers, including fast sieves and factoring (ntheory)"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=(
    'glibc>=2.25'
    'perl>=5.6.2'
    'perl-math-prime-util-gmp>=0.51'
)
optdepends=(
    'perl-math-bigint-gmp: for faster BigInt operations.'
)
makedepends=()
_githash="c20fed38aea4a0675d5ff7b5cdc43a47c815d027"
provides=(
    'perl-math-prime-util'
    'perl-math-prime-util-chacha'
    'perl-math-prime-util-ecaffinepoint'
    'perl-math-prime-util-ecprojectivepoint'
    'perl-math-prime-util-entropy'
    'perl-math-prime-util-memfree'
    'perl-math-prime-util-pp'
    'perl-math-prime-util-ppfe'
    'perl-math-prime-util-primalityproving'
    'perl-math-prime-util-primearray'
    'perl-math-prime-util-primeiterator'
    'perl-math-prime-util-randomprimes'
    'perl-math-prime-util-zetabigfloat'
    'perl-ntheory'
)
url='https://metacpan.org/release/Math-Prime-Util'
source=("34.patch" "https://github.com/danaj/Math-Prime-Util/archive/$_githash.zip")
md5sums=('1a85cfb5afacd0a065ba4c033355cbe1'
         '363c0584aeaaac479e43f9cbda90e7a5')
sha512sums=('9ee18c357fce8d8a0575db8c204197f836fa6967606dbc51180fbd31f2abf6bdca6b1a1cfa8fccd1bbaf2bc6511046b742870240632051898a2c5ee73712361a'
            'c2c04218d8ddcdba28884ece55b0b81ab9c502f6007f64680d4c289b654c26a9ae68837e7fd171b6fa92aaa695198572768c260809c5316bd7e311c71006ebcc')
_distdir="Math-Prime-Util-$_githash"

prepare() {
    cd "$srcdir/$_distdir"
    patch --forward --strip=1 --input="${srcdir}/34.patch"
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
