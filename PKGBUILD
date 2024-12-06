# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=agat
_pkgname=AGAT
pkgver=1.4.2
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
sha512sums=('9f74d06963343c277c8ad93fa9587f8a7b74fa14a45812548b312ec1e9f8e2a72242bcd7d4815ebc77fff0e17c700c0ed53c6f9057e365dbfc224fd516283b77')
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
