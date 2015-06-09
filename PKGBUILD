# Maintainer: Damien Guihal <dguihal@gmail.com>

pkgname=perl-net-sftp
pkgver=0.10
pkgrel=3
pkgdesc="Secure File Transfer Protocol client"
url="http://search.cpan.org/~dbrobins/Net-SFTP/"
depends=('perl')
arch=('i686' 'x86_64')
license="Artistic License"
options=('')
source=(http://search.cpan.org/CPAN/authors/id/D/DB/DBROBINS/Net-SFTP-$pkgver.tar.gz)
sha256sums=('00cd1169cc50151926af96cad61f070c52d7236dd6bd996b7cc63952fb0a7de5')

build() {
  cd  $startdir/src/Net-SFTP-$pkgver
  eval `perl -V:archname`
  # Force module installation to "current" perl directories.
  /usr/bin/perl Makefile.PL \
      INSTALLARCHLIB=/usr/lib/perl5/current/${archname} \
      INSTALLSITELIB=/usr/lib/perl5/site_perl/current \
      INSTALLSITEARCH=/usr/lib/perl5/site_perl/current/${archname}
  /usr/bin/make || return 1
  /usr/bin/make DESTDIR=$startdir/pkg install
  # remove *.pod, .packlist:
  /usr/bin/find $startdir/pkg -name '.packlist' -exec rm  '{}' \;
  /usr/bin/find $startdir/pkg -name '*.pod' -exec rm  '{}' \;
}
