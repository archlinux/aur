# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: John D Jones III <jnbek1972@gmail.com>

pkgname=perl-string-escape
pkgdesc='Backslash escapes, quoted phrase, word elision, etc'
pkgver=2010.002
pkgrel=4
url='https://metacpan.org/dist/String-Escape'
arch=(any)
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
# See https://metacpan.org/dist/String-Escape/source/Makefile.PL
makedepends=('perl-extutils-makemaker>=6.3002')
checkdepends=(
  'perl-test-simple' # "Test::More"
)
options=(!emptydirs)
source=("https://cpan.metacpan.org/authors/id/E/EV/EVO/String-Escape-${pkgver}.tar.gz"
        'perl-string-escape-0001-backlash.patch'
        'perl-string-escape-0002-incorrect-escape.patch'
        'perl-string-escape-0003-elide-size.patch')
b2sums=('d012323bdf10b9c8e47c90dfe1bbb064e09c7a0b00c469d9285d8a9a7ad1ee80b1d30b1fff1d5218d4491a36780174526273775dac790db2f22c0a22cc01fb14'
        '0aa130763b6c25bf6161ecef34265b13c3713ef4ac38a6ed90c4836f6292e1b3ac3f95eef525a4798d34af378ab5676e1cc80cb177be7acc8410c2639a6e97c4'
        '6d8689462423d22cb31ef2600c26489c225eb77f739ee291e6a9eab7d5bde8a9b42db8e5eae4b22757a388ab5f18fa25f1e68e5369e4fdf9ddb6bcdbe13e61dc'
        'ac18abc47f5f0450429b315751f652aabce4d207a4f734776de8868fb08027d2e20b5acd04e952313815b5f249ba83e0a60a74d83f2cbfc56e5eb8b09a76ca90')

prepare() {
  cd "String-Escape-${pkgver}"

  patch -t -Np1 -i ../perl-string-escape-0001-backlash.patch
  patch -t -Np1 -i ../perl-string-escape-0002-incorrect-escape.patch
  patch -t -Np1 -i ../perl-string-escape-0003-elide-size.patch
}

build() {
  cd "String-Escape-${pkgver}"

  unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
  make
}

check() {
  cd "String-Escape-${pkgver}"

  unset PERL5LIB PERL_LOCAL_LIB_ROOT
  make test
}

package() {
  cd "String-Escape-${pkgver}"

  unset PERL5LIB PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
