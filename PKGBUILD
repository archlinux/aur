# Contributor: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-math-prime-util-gmp'
pkgver='0.51.git'
pkgrel='1'
pkgdesc="Math::Prime::Util::GMP - utilities related to prime numbers and factoring, using GMP"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glibc>=2.24' 'gmp>=6.1.1' 'perl>=5.6.2')
makedepends=()
_githash="b28e8cbb18f4202912fe1e116963efc223c7722c"
url='https://metacpan.org/release/Math-Prime-Util-GMP'
source=("14.patch" "15.patch" "https://github.com/danaj/Math-Prime-Util-GMP/archive/$_githash.zip")
md5sums=('76b0d6e19691481753120f987cb74dbb'
         '22505647bf0e0982bcd3ccebd376508d'
         'a342145b53aed73741e9053e007188a0')
sha512sums=('d3ec15d04bd8181d4aa4b58c99de3676b4100ca566a2726d0bbb3f8eca151b991a3c34d728eb02202eab3315b4583282df166b61fb5dc905e840b67d062a0cc3'
            '1b0eb05878368d30b9d3a606b172bf311e8ccfbdff8147b2227a011f0f8d4ea1000d4cf1274e239ee95182fd754de1cd9ceff5596851d32c63127ef33ad6acd5'
            '783c5b243ca61631b21f1daed26dad808f508d04366a8622077bee01a64736b0d5740f3a0f4bcac2b430928e13e442722242e3894ca8a72dbf140c475caa14f8')
_distdir="Math-Prime-Util-GMP-$_githash"

prepare() {
    cd "$srcdir/$_distdir"
    patch --forward --strip=1 --input="${srcdir}/14.patch"
    patch --forward --strip=1 --input="${srcdir}/15.patch"
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
