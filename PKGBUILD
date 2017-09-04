# Contributor: mober <maxATmoberDOTat>

pkgname=perl-image-librsvg
pkgver=0.07
pkgrel=2
pkgdesc='This packages the SMBus distribution, containing the Device::SMBus module!'
_dist=Image-LibRSVG
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl' 'librsvg')
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/T/TO/TOMSON/$_dist-$pkgver.tar.gz"
        "https://rt.cpan.org/Ticket/Attachment/342021/153391/430805.patch"
        "58454.patch"
        "disableCompressionSupported.patch")
md5sums=('43bcff1a9994ed5e184d44e49d2bd7fa'
         'fcb2f5dc83573e23833bed6295f0a2b9'
         'ecaf769fc88f4f6b48891e2b3a17c156'
         '2f4b436a5047a5cb1d9a0520909cc622')

prepare() {
  cd "$srcdir/$_dist-$pkgver"
  patch -Np0 -i "${srcdir}/430805.patch"
  patch -Np0 -i "${srcdir}/58454.patch"
  patch -Np0 -i "${srcdir}/disableCompressionSupported.patch"
}

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
