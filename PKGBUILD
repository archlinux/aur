# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=agat
_pkgname=AGAT
pkgver=1.4.1
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
sha512sums=('cf3af804bad8b5c5297aaac2f9f3dfb476dfa94f780b4ec0d6fcaa1354f0cab5e782e35ca948084508fde621fdb562f7525a724cb02c3afd0a3b87d1dd7b2fdc')
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
