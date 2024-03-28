# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=agat
_pkgname=AGAT
pkgver=1.3.3
pkgrel=1
pkgdesc="Another Gtf/Gff Analysis Toolkit is a suite of tools to handle gene annotations in GTF/GFF format. doi:10.5281/zenodo.3552717"
arch=('any')
url='https://github.com/NBISweden/AGAT'
license=('GPL3')
depends=(
         'perl-bioperl'
         'perl-carp-clan'
         'perl-clone'
         'perl-file-share'
         'perl-file-sharedir'
         'perl-file-sharedir-install'
         'perl-graph'
	 'perl-libwww'
         'perl-lwp-protocol-https'
         'perl-lwp-useragent-determined'
         'perl-moose'
         'perl-sort-naturally'
         'perl-yaml-libyaml'
	 'perl-term-progressbar'
	 'perl-list-moreutils'
        )
source=($pkgname-$pkgver.tar.gz::https://github.com/NBISweden/AGAT/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('af9b27e2fc334ed5206ec24f9d5cc052a8455de0379f433b579c35d4026d3f997a4a2f3d21fe1f1dacca45a9b6a8a1fefc68fadf4fd47474874f27f078015b31')
options=('!emptydirs' 'purge')

build() {
   cd $_pkgname-$pkgver
   perl Makefile.PL INSTALLDIRS=vendor

   make PREFIX="$pkgdir"/usr INSTALLDIR=${pkgdir}/usr/bin
}

package() {
  cd $_pkgname-$pkgver
  install -dm755  "$pkgdir"/usr/bin/vendor_perl

  make install DESTDIR="$pkgdir"
  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
