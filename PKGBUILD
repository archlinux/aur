# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sebastian Köhler <sebkoehler@whoami.org.uk> 
# Generator  : CPANPLUS::Dist::Arch 0.20
pkgname=perl-audio-mixer
_cpanname=Audio-Mixer
pkgver=0.7
pkgrel=16
pkgdesc="Sound mixer control using ioctl"
arch=(i686 x86_64)
license=(PerlArtistic GPL)
depends=('perl>=0')
options=('!emptydirs')
url="https://metacpan.org/release/Audio-Mixer"
source=("http://cpan.metacpan.org/authors/id/S/SE/SERGEY/$_cpanname-$pkgver.tar.gz")
md5sums=('5aaa808a4852ed68f952705172ece2a8')

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
