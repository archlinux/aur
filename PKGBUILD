# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sebastian Köhler <sebkoehler@whoami.org.uk> 
# Generator  : CPANPLUS::Dist::Arch 0.20
pkgname=perl-audio-mixer
_cpanname=Audio-Mixer
pkgver=0.7
pkgrel=18
pkgdesc="Sound mixer control using ioctl"
arch=(i686 x86_64)
license=(PerlArtistic GPL)
depends=('perl>=0')
options=('!emptydirs')
url="https://metacpan.org/release/Audio-Mixer"
source=("http://cpan.metacpan.org/authors/id/S/SE/SERGEY/$_cpanname-$pkgver.tar.gz")
sha512sums=('a2adacf34c4bfbe4e436cf399a8585689f680f90a362931fd09e0f62f08e2ab59615361daae3a65c4fbf00946196e1dbc0207a7973c3c5a875f73f673f167568')

build() {
  cd "$srcdir/$_cpanname-$pkgver"

  # install module in vendor directories
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
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
  cd "$srcdir/$_cpanname-$pkgver"
  make DESTDIR="$pkgdir/" install

  #remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
  _perl_depends
}
