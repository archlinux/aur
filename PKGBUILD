# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=perl-test-unit
pkgver=0.25
pkgrel=1
pkgdesc="A unit testing framework for Perl"
arch=('any')
url="https://metacpan.org/dist/Test-Unit"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-class-inner' 'perl-devel-symdump' 'perl-error')
makedepends=('html2text')
optdepends=('perl-tk')
source=("https://www.cpan.org/modules/by-module/Test/Test-Unit-${pkgver}.tar.gz"
        "https://rt.cpan.org/Public/Ticket/Attachment/1377432/731337/0001-Accept-all-family-differences-in-the-AssertTest-test.patch"
        "perl5.14.patch.html::https://sourceforge.net/p/perlunit/git/ci/15102f68798b2d5c15be5b8b048883c9ede66cb5/tree/t/tlib/AssertTest.pm?barediff=f37604e69edb07eac8262f3591e45465ff6ed6c4"
        "https://rt.cpan.org/Public/Ticket/Attachment/1089367/572655/perl5.16.patch")
sha512sums=('8f76583c7480eec825080eb6cd94d1b1a1c7c3bc7f297607414c95777e9a9f880b5a0d927a41521389ae50c2ba1b9ec3d76149da47d5997add739970df6b154d'
            '19f30499824c7083b42297968fcbad4e4e7977bbe46ffd547857c0b42e708355180d5e44e0ec46aadeb62452cd4afdbaa1ca55ba97c661ccc576c980ccb2e5c6'
            '6901a245d8db690ce9c9c233efadc7638cd4ed1fc2243a711570d543fd43c379fe8574c1c2f332322536725c2ef5407c37a4c93be1b6cb442f44d94439614f0e'
            '65291f1b2d86405bbb64d19373ffab26a11bc5224803266f4058d0b14baba2f4dd501ad26a281ce74b9691773a461704e0bed7f53211b94441533e859fccb062')

prepare() {
  cd "${srcdir}/Test-Unit-${pkgver}"

  patch -Np1 < "${srcdir}/0001-Accept-all-family-differences-in-the-AssertTest-test.patch"
  html2text "${srcdir}/perl5.14.patch.html" | patch -Np1
  patch -Np1 < "${srcdir}/perl5.16.patch"
}

build() {
  cd "${srcdir}/Test-Unit-${pkgver}"

  perl Makefile.PL NO_PACKLIST=true NO_PERLLOCAL=true
  make
}

check() {
  cd "${srcdir}/Test-Unit-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/Test-Unit-${pkgver}"

  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
