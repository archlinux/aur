# Maintainer : Laël Guillemenot <zeppelinlg@gmail.com>

pkgname=perl-cache-cache
_cpanname=Cache-Cache
pkgver=1.06
pkgrel=3
pkgdesc="Generic cache interface and implementations"
arch=('any')
url="http://search.cpan.org/~JSWARTZ/${_cpanname}"
license=('GPL' 'PerlArtistic')
depends=('perl-digest-sha1>=2.02' 'perl-error>=0.15' 'perl-ipc-sharelite>=0.09')
options=('!emptydirs')
source=(http://www.cpan.org/authors/id/J/JS/JSWARTZ/${_cpanname}-${pkgver}.tar.gz) 
md5sums=('4425f44ddb138a799290802e5aad46ef')
build() {
  cd $srcdir/${_cpanname}-${pkgver}
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1 
  make || return 1
}
package() {
  cd $srcdir/${_cpanname}-${pkgver}
  make install DESTDIR=$pkgdir || return 1
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}
