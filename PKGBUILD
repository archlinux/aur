# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=perl-net-pcap
_realname=Net-Pcap
pkgver=0.17
pkgrel=3
pkgdesc="Perl/CPAN Module Net::Pcap"
arch=("i686" "x86_64")
url="https://metacpan.org/release/$_realname"
license=("GPL" "PerlArtistic")
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/S/SA/SAPER/$_realname-$pkgver.tar.gz"
	makefile.patch
	listdatalinks.patch)
depends=('perl' 'libpcap')
md5sums=('fbe911ba5f57d5ba43494434ffb828a0'
         '5e96f92128b562f66ba092d23700f6c1'
         'c6781cc15f79672b91fe3be96cb43c3d')

build() {
  cd $srcdir/$_realname-$pkgver
  patch -p1 <../makefile.patch
  patch -p1 <../listdatalinks.patch

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
package() {
  cd $srcdir/$_realname-$pkgver

  make install DESTDIR=$pkgdir/

  # remove perllocal.pod and .packlist
  find $pkgdir -name perllocal.pod -delete
  find $pkgdir -name .packlist -delete
}
