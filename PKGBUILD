# Maintainer: Michael Gerdau <mgd@qata.de>
# Maintainer: omangold
# Maintainer: Daenyth
# Contributor: Georg Grabler (STiAT) <ggrabler@gmail.com>

pkgname='perl-ogg-vorbis-header'
pkgver='0.11'
pkgrel='3'
pkgdesc="An object-oriented interface to Ogg Vorbis"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-inline>=0.44' 'perl-inline-c>=0')
makedepends=()
url='https://metacpan.org/release/Ogg-Vorbis-Header'
source=("http://search.cpan.org/CPAN/authors/id/D/DA/DAVECROSS/Ogg-Vorbis-Header-${pkgver}.tar.gz"
	"sv_ptr.patch")
md5sums=('6155966ef4592641a61730a4a199b7a3'
	 'cc395e57c83e0991a6caa4c160eb1d58')
sha512sums=('edef27bcb7d737a655c6f3c6dc4311442bb97f9cdebd14d930a0443fc56f073d47ec73fe2fddbe5d4b00670f8cc833ae6263796f0017d846b43a6dba44866b2b'
	    'ab964c45c947390c378bbf2e6b3dc0b4d99ebd44e93a72f42cb34e0ccc2b1fca2ce038b4fd855b01e8cdb85e49982b55ea73cbb8634febecb28f7864459f2dd4')
_distdir="Ogg-Vorbis-Header-${pkgver}"

prepare() {
  patch -d $_distdir -Np1 -i ../sv_ptr.patch
}

package() {
  cd $srcdir/$_distdir
  perl Makefile.PL || return 1
  make || return 1
  make test || return 1
  make DESTDIR=$pkgdir install || return 1
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
