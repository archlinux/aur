# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=agat
_pkgname=AGAT
pkgver=1.3.1
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
sha512sums=('2cc0eaf32544e016238611b176e43fbb333ad490a44c9195a4a73764b5fa005d4f808f115152da99e75a030ce1e76c642b9d97ad0d0598fdfd7bb75055051c7c')
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
